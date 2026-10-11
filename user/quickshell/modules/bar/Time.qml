import QtQuick
import QtQuick.Layouts

Item {
    id: timeWidget

    Layout.preferredWidth: timeText.implicitWidth
    Layout.fillHeight: true
    Layout.alignment: Qt.AlignVCenter

    property string currentTime: Qt.formatTime(new Date(), "hh:mm")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeWidget.currentTime = Qt.formatTime(new Date(), "hh:mm")
    }

    Text {
        id: timeText
        anchors.centerIn: parent
        text: timeWidget.currentTime
        font.family: "Tahoma"
        font.pixelSize: 11
        color: "white"
    }
}
