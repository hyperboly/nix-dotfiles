import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Niri

RowLayout {
    id: windowList
    spacing: 3

    Layout.fillHeight: true
    Layout.fillWidth: true

    required property Niri niri

    property var focusedWorkspaceId: -1

    Component.onCompleted: {
        console.log("OpenWindows loaded. niri:", niri,
                     "connected:", niri.isConnected(),
                     "windows.count:", niri.windows.count,
                     "workspaces.count:", niri.workspaces.count)
    }

    Repeater {
        model: windowList.niri.workspaces
        delegate: Item {
            visible: false
            property bool wsFocused: model.isFocused
            property var wsId: model.id
            onWsFocusedChanged: {
                console.log("workspace", wsId, "focused ->", wsFocused)
                if (wsFocused) windowList.focusedWorkspaceId = wsId
            }
            Component.onCompleted: {
                console.log("workspace delegate created, id:", wsId, "isFocused:", wsFocused)
                if (wsFocused) windowList.focusedWorkspaceId = wsId
            }
        }
    }

    Repeater {
        model: windowList.niri.windows

        delegate: Rectangle {
            id: taskButton

            visible: model.workspaceId === windowList.focusedWorkspaceId

            Component.onCompleted: {
                console.log("window delegate:", model.title, "wsId:", model.workspaceId,
                             "focusedWorkspaceId:", windowList.focusedWorkspaceId,
                             "visible:", visible)
            }

            Layout.preferredWidth: 160
            Layout.maximumWidth: 200
            Layout.fillHeight: true
            Layout.topMargin: 5
            Layout.bottomMargin: 2
            radius: 3
            clip: true

            readonly property bool isFocused: model.isFocused

            gradient: Gradient {
                GradientStop { position: 0.0; color: taskButton.isFocused ? "#1a4cb0" : "#3d7be6" }
                GradientStop { position: 0.4; color: taskButton.isFocused ? "#16419c" : "#2865d7" }
                GradientStop { position: 1.0; color: taskButton.isFocused ? "#0d2c70" : "#1a51b8" }
            }

            border.width: 1
            border.color: taskButton.isFocused ? "#0a1f4d" : "#0f2f70"

            Rectangle {
                anchors.fill: parent
                anchors.margins: 1
                radius: Math.max(0, parent.radius - 1)
                color: "transparent"
                gradient: Gradient {
                    GradientStop { position: 0.0; color: taskButton.isFocused ? "#300a1f4d" : "#557faaff" }
                    GradientStop { position: 0.5; color: "#00000000" }
                    GradientStop { position: 1.0; color: taskButton.isFocused ? "#334a86f7" : "#220f2f70" }
                }
            }

            Rectangle {
                id: hoverOverlay
                anchors.fill: parent
                radius: parent.radius
                color: "white"
                opacity: mouseArea.containsMouse ? 0.14 : 0
                Behavior on opacity {
                    NumberAnimation { duration: 120 }
                }
            }

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 6
                anchors.rightMargin: 6
                spacing: 6


                IconImage {
                    id: appIcon
                    source: model.iconPath ? "file://" + model.iconPath : ""
                    Layout.preferredWidth: 16
                    Layout.preferredHeight: 16
                    visible: status === Image.Ready
                }

                Rectangle {
                    Layout.preferredWidth: 14
                    Layout.preferredHeight: 14
                    color: "transparent"
                    border.color: "#ffffff"
                    border.width: 1
                    visible: !appIcon.visible

                    Text {
                        anchors.centerIn: parent
                        text: "w"
                        font.family: "Tahoma"
                        font.pixelSize: 9
                        color: "white"
                    }
                }

                Text {
                    Layout.fillWidth: true
                    text: model.title && model.title !== "" ? model.title : "Untitled Window"
                    font.family: "Tahoma"
                    font.pixelSize: 11
                    font.bold: taskButton.isFocused
                    color: "white"
                    elide: Text.ElideRight
                }
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: windowList.niri.focusWindow(model.id)
            }
        }
    }
}
