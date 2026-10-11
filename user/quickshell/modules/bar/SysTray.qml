import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

RowLayout {
    id: sysTray
    spacing: 4
    Layout.fillHeight: true
    Layout.alignment: Qt.AlignVCenter

    Repeater {
        model: SystemTray.items

        delegate: Item {
            id: trayIcon

            required property SystemTrayItem modelData

            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
            Layout.alignment: Qt.AlignVCenter

            IconImage {
                id: iconImg
                anchors.fill: parent
                source: trayIcon.modelData.icon
                implicitSize: 16
                asynchronous: true
            }

            Rectangle {
                anchors.fill: parent
                visible: iconImg.status !== Image.Ready
                color: "transparent"
                border.color: "#aaaaaa"
                border.width: 1
            }

            QsMenuAnchor {
                id: menuAnchor
                menu: trayIcon.modelData.menu
                anchor.item: trayIcon
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: function(mouse) {
                    if (mouse.button === Qt.LeftButton) {
                        trayIcon.modelData.activate();
                    } else if (mouse.button === Qt.RightButton) {
                        if (trayIcon.modelData.hasMenu) {
                            menuAnchor.open();
                        } else {
                            trayIcon.modelData.secondaryActivate();
                        }
                    }
                }
            }
        }
    }
}
