import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Rectangle {
    id: rightRect
    color: "black"

    ListView {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        model:ListModel {
            ListElement
            {
                label: "Mode"
                attributes:
                    [
                    ListElement { description: "Normal" },
                    ListElement { description: "Peak" },
                    ListElement { description: "High Res" },
                    ListElement { description: "Average" }
                ]
            }
            ListElement
            {
                label: "Acquire Mode"
                attributes:
                    [
                    ListElement { description: "Equivalent" },
                    ListElement { description: "Real-time" }
                ]
            }
            ListElement
            {
                label: "FastAcq"
                attributes:
                    [
                    ListElement { description: "Coarse" },
                    ListElement { description: "Fine" }
                ]
            }
        }


        delegate: ColumnLayout {
            width: parent.width

            Label {
                text: label
                Layout.preferredWidth: parent.width/2
            }
            ComboBox {
                model: attributes
                Layout.fillWidth: true
            }
        }
    }
}

