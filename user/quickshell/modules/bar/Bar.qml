//bar.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Niri

PanelWindow {
    id: bar

    required property Niri niri

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
            OpenWindows { niri: bar.niri }

            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                id: trayArea
                Layout.preferredWidth: trayRow.implicitWidth + 20
                Layout.fillHeight: true

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#3fa9f5" }
                    GradientStop { position: 0.12; color: "#2f92e6" }
                    GradientStop { position: 0.5; color: "#1f7ed4" }
                    GradientStop { position: 1.0; color: "#1665b8" }
                }

                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: parent.height * 0.4
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#40ffffff" }
                        GradientStop { position: 1.0; color: "#00ffffff" }
                    }
                }

                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    implicitHeight: 1
                    color: "#00287a"
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 1
                    color: "#0a2d75"
                }
                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: 1
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 1
                    color: "#5b9ef2"
                }

                RowLayout {
                    id: trayRow
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 8
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    spacing: 6

                    SysTray {}
                    Battery {  }
                    Volume {  }
                    Time {}
                }
            }
        }
    }
}
