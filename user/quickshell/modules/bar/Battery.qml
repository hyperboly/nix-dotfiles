import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.UPower

Item {
    id: batteryIcon

    Layout.preferredWidth: 16
    Layout.preferredHeight: 16
    Layout.alignment: Qt.AlignVCenter

    readonly property UPowerDevice device: UPower.displayDevice
    readonly property bool ready: device.ready
    readonly property real percentage: device.percentage
    readonly property bool charging: device.state === UPowerDeviceState.Charging

    property bool hoveringIcon: false
    property bool hoveringPopup: false

    function iconSource() {
        if (!batteryIcon.ready) return "../assets/battery-medium.png";

        var pct = batteryIcon.percentage <= 1 ? batteryIcon.percentage * 100 : batteryIcon.percentage;

        if (batteryIcon.charging) return "../assets/battery-charging.png";
        if (pct >= 60) return "../assets/battery-high.png";
        if (pct >= 35) return "../assets/battery-medium.png";
        if (pct >= 15) return "../assets/battery-low.png";
        return "../assets/battery-critical.png";
    }

    Timer {
        id: closeTimer
        interval: 150
        onTriggered: {
            if (!batteryIcon.hoveringIcon && !batteryIcon.hoveringPopup) {
                if (batteryPopupLoader.item) batteryPopupLoader.item.visible = false;
            }
        }
    }

    onHoveringIconChanged: updateVisibility()
    onHoveringPopupChanged: updateVisibility()

    function updateVisibility() {
        if (hoveringIcon || hoveringPopup) {
            batteryPopupLoader.active = true;
            batteryPopupLoader.item.visible = true;
            closeTimer.stop();
        } else {
            closeTimer.restart();
        }
    }

    Image {
        anchors.fill: parent
        source: Qt.resolvedUrl(batteryIcon.iconSource())
        smooth: true
        asynchronous: true
        fillMode: Image.PreserveAspectFit
        onStatusChanged: {
            if (status === Image.Error) console.warn("Battery icon failed to load:", source);
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: batteryIcon.hoveringIcon = true
        onExited: batteryIcon.hoveringIcon = false
    }

    LazyLoader {
        id: batteryPopupLoader
        loading: true

        PopupWindow {
            id: batteryPopup
            color: "transparent"

            anchor {
                item: batteryIcon
                rect.x: -(implicitWidth / 2) + batteryIcon.width / 2
                rect.y: -implicitHeight - 15
            }

            implicitWidth: 160
            implicitHeight: 60

            visible: false

            Rectangle {
                anchors.fill: parent
                color: "#24273a"
                border.width: 1
                border.color: "#6e738d"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: batteryIcon.hoveringPopup = true
                    onExited: batteryIcon.hoveringPopup = false
                }

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 4

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: batteryIcon.ready
                              ? Math.round((batteryIcon.percentage <= 1 ? batteryIcon.percentage * 100 : batteryIcon.percentage)) + "% available"
                              : "Calculating..."
                        font.family: "Tahoma"
                        font.pixelSize: 11
                        color: "#cad3f5"
                    }

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: batteryIcon.charging ? "(charging)" : "(on battery)"
                        font.family: "Tahoma"
                        font.pixelSize: 10
                        color: "#b8c0e0"
                    }
                }
            }
        }
    }
}
