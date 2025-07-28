import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects  // Use Qt6-compatible GraphicalEffects
import QtQuick.Layouts
import QtQuick.Dialogs  // Use Qt6-compatible Dialogs
import "components"  // Import our custom components


ApplicationWindow {
    id: window; width: 1200; height: 800; visible: true
    title: qsTr("Neon Plotter GUI"); color: "#1E1E2E"

    // Top toolbar
    ToolBar {
        id: header; anchors.top: parent.top; width: parent.width; height: 50
        Rectangle { anchors.fill: parent; color: "#4c00fdff"; opacity: 0.85 }
        RowLayout { anchors.centerIn: parent; spacing: 40;
            NeonButton { text: qsTr("导入数据"); iconSource: "../icons/upload.png" }
            NeonButton { text: qsTr("一键美化"); iconSource: "../icons/magic.png" }
            NeonButton { text: qsTr("导出"); iconSource: "../icons/export.png" }
            NeonButton { text: qsTr("主题切换"); iconSource: "../icons/palette.png" }
            NeonButton { text: qsTr("帮助"); iconSource: "../icons/help.png" }
        }
    }

    // Left sidebar
    BlurPanel {
        id: sidebar; width: 240
        anchors { top: header.bottom; bottom: parent.bottom; left: parent.left }
        Column { anchors.fill: parent; anchors.margins: 16; spacing: 10
            Label { text: qsTr("最近项目"); color: "#E0E0E0"; font.pixelSize: 18 }
            ListView {
                model: ["project1", "project2"]
                delegate: Text { text: modelData; color: "#E0E0E0"; font.pixelSize: 14 }
                clip: true
            }
        }
    }

    // Right inspector
    BlurPanel {
        id: inspector; width: 320
        anchors { top: header.bottom; bottom: parent.bottom; right: parent.right }
        ScrollView {
            anchors.fill: parent; anchors.margins: 16
            ColumnLayout { spacing: 24
                ParameterGroup {
                    title: qsTr("样式")
                    Column { spacing: 12
                        Slider { from: 0; to: 10; value: 2 }
                        ColorDialog { id: colorDlg }
                        NeonButton { text: qsTr("选择颜色"); onClicked: colorDlg.open() }
                    }
                }
                ParameterGroup {
                    title: qsTr("导出")
                    Column { spacing: 12
                        ComboBox { model: ["PNG", "SVG", "PDF"] }
                        NeonButton { text: qsTr("开始导出") }
                    }
                }
            }
        }
    }

    // Central plot area
    PlotView {
        id: plotArea
        anchors { top: header.bottom; bottom: parent.bottom; left: sidebar.right; right: inspector.left }
    }
}