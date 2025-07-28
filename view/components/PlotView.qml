import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
Rectangle {
    id: root
    property bool darkMode: true
    color: darkMode ? "#1E1E2E" : "#FFFFFF"

    // Placeholder content (replace with real plot integration)
    Text {
        anchors.centerIn: parent
        text: qsTr("[Plot Preview]")
        color: "#6EAFFF"
        font.pixelSize: 32
    }

    // Gesture handling for zoom / pan can be implemented here later.
}
