import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: root

    anchors {
        bottom: true
        left: true
        right: true
    }
    implicitHeight: 35

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#225ad2" }
            GradientStop { position: 0.08; color: "#387be0" }
            GradientStop { position: 0.20; color: "#1a53bf" }
            GradientStop { position: 1.0; color: "#0d3b99" }
        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            implicitHeight: 1
            color: "#00287a"
        }

        RowLayout {
            anchors.fill: parent
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 2
            spacing: 4

            XpStartButton {}

            Rectangle {
                Layout.preferredWidth: 160
                Layout.fillHeight: true
                radius: 2

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#3d7be6" }
                    GradientStop { position: 0.4; color: "#2865d7" }
                    GradientStop { position: 1.0; color: "#1a51b8" }
                }

                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    implicitHeight: 1
                    color: "#7faaff"
                }
                Rectangle {
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    width: 1
                    color: "#7faaff"
                }
                Rectangle {
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    width: 1
                    color: "#0f2f70"
                }
                Rectangle {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    implicitHeight: 1
                    color: "#0f2f70"
                }

                Text {
                    anchors.centerIn: parent
                    text: "Niri Window"
                    font.family: "Tahoma"
                    font.pixelSize: 11
                    color: "white"
                    elide: Text.ElideRight
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.preferredWidth: 80
                Layout.fillHeight: true

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#0e3175" }
                    GradientStop { position: 1.0; color: "#0c67d2" }
                }

                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    implicitHeight: 1
                    color: "#071a3d"
                }
                Rectangle {
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    width: 1
                    color: "#071a3d"
                }

                Text {
                    anchors.centerIn: parent
                    text: Qt.formatTime(new Date(), "hh:mm AP")
                    font.family: "Tahoma"
                    font.pixelSize: 11
                    color: "white"
                }
            }
        }
    }
}
