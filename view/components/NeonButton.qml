import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

Button {
    id: control
    property alias iconSource: iconImg.source

    // Colors
    property color baseBorder: "#6f77d6ff"
    property color hoverBorder: "#FF6E6E"

    background: Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.width: 2
        border.color: control.down ? hoverBorder : baseBorder
        radius: 8

        // Neon glow effect
        DropShadow {
            anchors.fill: parent
            source: parent
            horizontalOffset: 0; verticalOffset: 0
            radius: 12; samples: 16
            color: parent.border.color
        }
    }

    contentItem: Row {
        anchors.centerIn: parent
        spacing: 8
        Image { id: iconImg; width: 20; height: 20 }
        Text { text: control.text; color: "#ffffffff"; font.pixelSize: 16 }
    }

    // Hover animation
    states: [
        State {
            name: "hover"; when: control.hovered
            PropertyChanges { target: control; baseBorder: hoverBorder }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties: "baseBorder"; duration: 200 }
    }
}