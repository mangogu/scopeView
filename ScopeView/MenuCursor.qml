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
                label: "Type"
                attributes:
                    [
                    ListElement { description: "Off" },
                    ListElement { description: "On" }
                ]
            }
            ListElement
            {
                label: "Mode"
                attributes:
                    [
                    ListElement { description: "Off" },
                    ListElement { description: "Time" },
                    ListElement { description: "Amplitude" }
                ]
            }
            ListElement
            {
                label: "V Units"
                attributes:
                    [
                    ListElement { description: "Second" },
                    ListElement { description: "Hertz" }
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

