import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    property alias title: titleText.text
    property alias content: contentContainer
    property bool darkMode: true

    Column {
        anchors.fill: parent; spacing: 8
        Text {
            id: titleText
            text: "Group"
            color: root.darkMode ? "#E0E0E0" : "#202020"
            font.pixelSize: 18
        }
        Rectangle {
            height: 2
            width: parent.width
            color: root.darkMode ? "#2E2E3E" : "#CFCFCF"
        }
        // Placeholder for injected content
        Item { id: contentContainer; anchors.left: parent.left; anchors.right: parent.right }
    }
}
