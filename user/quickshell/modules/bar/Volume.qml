import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Pipewire

Item {
    id: volumeIcon

    Layout.preferredWidth: 16
    Layout.preferredHeight: 16
    Layout.alignment: Qt.AlignVCenter

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property real volumeLevel: sink?.audio?.volume ?? 0
    readonly property bool muted: sink?.audio?.muted ?? true

    PwObjectTracker {
        objects: [volumeIcon.sink]
    }

    function iconSource() {
        if (volumeIcon.muted || volumeIcon.volumeLevel <= 0) return "../assets/volume-muted.png";
        return "../assets/volume-on.png";
    }

    function togglePopup() {
        volumePopupLoader.active = true;
        catcherLoader.active = true;
        var show = !volumePopupLoader.item.visible;
        volumePopupLoader.item.visible = show;
        catcherLoader.item.visible = show;
    }

    function closePopup() {
        if (volumePopupLoader.item) volumePopupLoader.item.visible = false;
        if (catcherLoader.item) catcherLoader.item.visible = false;
    }

    Image {
        anchors.fill: parent
        source: Qt.resolvedUrl(volumeIcon.iconSource())
        smooth: true
        asynchronous: true
        fillMode: Image.PreserveAspectFit
        onStatusChanged: {
            if (status === Image.Error) console.warn("Volume icon failed to load:", source);
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: function(mouse) {
            if (mouse.button === Qt.LeftButton) {
                volumeIcon.togglePopup();
            } else if (mouse.button === Qt.RightButton) {
                if (volumeIcon.sink?.ready && volumeIcon.sink?.audio) {
                    volumeIcon.sink.audio.muted = !volumeIcon.sink.audio.muted;
                }
            }
        }
    }

    LazyLoader {
        id: catcherLoader
        loading: true

        PanelWindow {
            id: catcher
            visible: false
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Top
            anchors { top: true; bottom: true; left: true; right: true }
            exclusiveZone: 0

            MouseArea {
                anchors.fill: parent
                onClicked: volumeIcon.closePopup()
            }
        }
    }

    LazyLoader {
        id: volumePopupLoader
        loading: true

        PopupWindow {
            id: volumePopup
            color: "transparent"

            anchor {
                item: volumeIcon
                rect.x: -(implicitWidth / 2) + volumeIcon.width / 2
                rect.y: -implicitHeight - 15
            }

            implicitWidth: 56
            implicitHeight: 200

            visible: false

            Rectangle {
                anchors.fill: parent
                color: "#24273a"
                border.width: 1
                border.color: "#6e738d"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 6

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "Volume"
                        font.family: "Tahoma"
                        font.pixelSize: 11
                        color: "#cad3f5"
                    }

                    Item {
                        id: sliderArea
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        readonly property int trackTop: 6
                        readonly property int trackBottom: height - 6
                        readonly property int trackHeight: trackBottom - trackTop

                        Rectangle {
                            id: track
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: sliderArea.trackTop
                            width: 4
                            height: sliderArea.trackHeight
                            color: "#7a7a7a"
                            border.width: 1
                            border.color: "#4d4d4d"
                        }

                        Rectangle {
                            id: filledTrack
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: track.bottom
                            width: 4
                            height: sliderArea.trackHeight * volumeIcon.volumeLevel
                            color: "#3d8ee0"
                        }

                        Rectangle {
                            id: thumb
                            width: 22
                            height: 10
                            radius: 2
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: sliderArea.trackTop + sliderArea.trackHeight * (1 - volumeIcon.volumeLevel) - height / 2

                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "#f5f5f5" }
                                GradientStop { position: 0.5; color: "#d4d4d4" }
                                GradientStop { position: 1.0; color: "#adadad" }
                            }
                            border.width: 1
                            border.color: "#6e6e6e"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onPositionChanged: function(mouse) {
                                if (pressed) updateVolume(mouse.y);
                            }
                            onPressed: function(mouse) {
                                updateVolume(mouse.y);
                            }

                            function updateVolume(y) {
                                var clampedY = Math.max(sliderArea.trackTop, Math.min(sliderArea.trackBottom, y));
                                var ratio = 1 - (clampedY - sliderArea.trackTop) / sliderArea.trackHeight;
                                if (volumeIcon.sink?.ready && volumeIcon.sink?.audio) {
                                    volumeIcon.sink.audio.muted = false;
                                    volumeIcon.sink.audio.volume = ratio;
                                }
                            }
                        }
                    }

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: Math.round(volumeIcon.volumeLevel * 100) + "%"
                        font.family: "Tahoma"
                        font.pixelSize: 10
                        color: "#b8c0e0"
                    }
                }
            }
        }
    }
}
