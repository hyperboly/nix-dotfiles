import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: startButton
    Layout.preferredWidth: 100
    Layout.fillHeight: true

    function outline(ctx, w, h) {
        var rx = h * 0.15;
        var ry = h / 2;
        var cx = w - rx;
        var cy = h / 2;

        ctx.beginPath();
        ctx.moveTo(0, 0);
        ctx.lineTo(cx, 0);

        ctx.save();
        ctx.translate(cx, cy);
        ctx.scale(rx / ry, 1);
        ctx.arc(0, 0, ry, -Math.PI / 2, Math.PI / 2, false);
        ctx.restore();

        ctx.lineTo(0, h);
        ctx.closePath();
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        onWidthChanged: requestPaint()
        onHeightChanged: requestPaint()
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var w = width;
            var h = height;

            startButton.outline(ctx, w, h);
            var baseGrad = ctx.createLinearGradient(0, 0, 0, h);
            baseGrad.addColorStop(0.00, "#66c26a");
            baseGrad.addColorStop(0.15, "#4caf50");
            baseGrad.addColorStop(0.50, "#388e3c");
            baseGrad.addColorStop(0.80, "#2e7d32");
            baseGrad.addColorStop(1.00, "#256628");
            ctx.fillStyle = baseGrad;
            ctx.fill();

            ctx.save();
            startButton.outline(ctx, w, h);
            ctx.clip();

            var glossGrad = ctx.createLinearGradient(0, 0, 0, h * 0.4);
            glossGrad.addColorStop(0.0, "rgba(255,255,255,0.32)");
            glossGrad.addColorStop(1.0, "rgba(255,255,255,0.0)");
            ctx.fillStyle = glossGrad;
            ctx.fillRect(0, 0, w, h * 0.4);

            ctx.restore();

            ctx.beginPath();
            ctx.moveTo(1, 1);
            ctx.lineTo(w - h / 2, 1);
            ctx.strokeStyle = "rgba(255,255,255,0.55)";
            ctx.lineWidth = 1;
            ctx.stroke();

            startButton.outline(ctx, w, h);
            ctx.strokeStyle = "#0f3010";
            ctx.lineWidth = 1;
            ctx.stroke();

            console.debug("startButton canvas repainted", w, h);
        }
    }

    Canvas {
        id: hoverOverlay
        anchors.fill: parent
        opacity: mouseArea.containsMouse ? 0.14 : 0
        Behavior on opacity {
            NumberAnimation { duration: 120 }
        }
        onWidthChanged: requestPaint()
        onHeightChanged: requestPaint()
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            startButton.outline(ctx, width, height);
            ctx.fillStyle = "white";
            ctx.fill();
        }
    }

    Item {
        id: contentContainer
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -4
        width: contentRow.implicitWidth
        height: contentRow.implicitHeight

        RowLayout {
            id: contentRow
            anchors.fill: parent
            spacing: 5

            Image {
                id: logo
                source: Qt.resolvedUrl("../assets/xp-logo.png")
                sourceSize.width: 22
                sourceSize.height: 22
                fillMode: Image.PreserveAspectFit
                smooth: true
            }

            Text {
                text: "Start"
                font.family: "Tahoma"
                font.pixelSize: 16
                font.bold: true
                font.italic: true
                color: "white"
            }
        }

        MultiEffect {
            anchors.fill: contentContainer
            source: contentRow

            shadowEnabled: true
            shadowColor: "#0a290a"
            shadowHorizontalOffset: 2
            shadowVerticalOffset: 3
            shadowBlur: 0.2
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onPressed: canvas.requestPaint()
        onReleased: canvas.requestPaint()
        onClicked: console.debug("Start button clicked")
    }
}
