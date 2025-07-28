import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
Item {
    id: root
    property alias content: container

    // Semi‑transparent background rectangle
    Rectangle {
        anchors.fill: parent
        color: "#FFFFFF"
        opacity: 0.25
    }

    // Gaussian blur effect (applied on the background behind panel)
    GaussianBlur {
        anchors.fill: parent
        source: ShaderEffectSource {
            sourceItem: parent
            recursive: true
            live: true
        }
        radius: 16
        samples: 17
    }

    // Container for real UI contents
    Item {
        id: container
        anchors.fill: parent
    }
}

