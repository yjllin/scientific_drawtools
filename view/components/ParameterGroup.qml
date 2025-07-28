import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    default property alias content: contentContainer.data
    property alias title: titleText.text

    Column {
        anchors.fill: parent; spacing: 8
        Text {
            id: titleText
            text: "Group"
            color: "#E0E0E0"; font.pixelSize: 18
        }
        Rectangle { height: 2; width: parent.width; color: "#2E2E3E" }
        // Placeholder for injected content
        Item { id: contentContainer; anchors.left: parent.left; anchors.right: parent.right }
    }
}
