import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: startButton
    Layout.preferredWidth: 100
    Layout.fillHeight: true

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var w = width;
            var h = height;

            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(w - 22, 0);

            ctx.arcTo(w, 0, w, h / 2, 12);
            ctx.arcTo(w, h, w - 22, h, 12);

            ctx.lineTo(0, h);
            ctx.closePath();

            var vertGrad = ctx.createLinearGradient(0, 0, 0, h);
            vertGrad.addColorStop(0.00, "#388e3c"); // Top rim highlight
            vertGrad.addColorStop(0.20, "#66bb6a"); // Upper-center bright spot
            vertGrad.addColorStop(0.65, "#2e7d32"); // Mid body
            vertGrad.addColorStop(0.90, "#1b5e20"); // Lower dark body
            vertGrad.addColorStop(1.00, "#0d3b11"); // Bottom shadow rim
            ctx.fillStyle = vertGrad;
            ctx.fill();

            // --- 3. HORIZONTAL GEL CUSHION (Lighter center, darker edges) ---
            var horizGrad = ctx.createLinearGradient(0, 0, w, 0);
            horizGrad.addColorStop(0.00, "rgba(0,0,0,0.25)");       // Dark left edge
            horizGrad.addColorStop(0.12, "rgba(255,255,255,0.0)");  // Transition
            horizGrad.addColorStop(0.40, "rgba(255,255,255,0.28)"); // Bright vertical center swell
            horizGrad.addColorStop(0.75, "rgba(0,0,0,0.0)");       // Transition
            horizGrad.addColorStop(1.00, "rgba(0,0,0,0.40)");       // Dark right curving edge
            ctx.fillStyle = horizGrad;
            ctx.fill();

            // --- 5. CLEAN DARK GREEN OUTER BORDER ---
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(w - 22, 0);
            ctx.arcTo(w, 0, w, h / 2, 12);
            ctx.arcTo(w, h, w - 22, h, 12);
            ctx.lineTo(0, h);

            ctx.strokeStyle = "#113b11"; // Standard dark green border
            ctx.lineWidth = 1;
            ctx.stroke();
        }
    }

    Item {
        id: contentContainer
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -4
        width: contentRow.implicitWidth
        height: contentRow.implicitHeight

        // 1. Target content to be shadowed
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
                text: "start"
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
            shadowColor: "#0a290a"      // Dark green XP shadow color
            shadowHorizontalOffset: 2   // 1px right
            shadowVerticalOffset: 3     // 1px down
            shadowBlur: 0.2             // Keep blur low for sharp retro rendering
        }
    }

    MouseArea {
        anchors.fill: parent
        onPressed: canvas.requestPaint()
        onReleased: canvas.requestPaint()
    }
}
