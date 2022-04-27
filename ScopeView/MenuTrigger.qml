import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Rectangle {
    id: rightRect
    color: "black"

    ListView {
        id: channel1Menu
        anchors.fill: parent
        anchors.margins: 10
        interactive: false
        spacing: 10

        model:ListModel {
            ListElement
            {
                label: "Type"
                attributes:
                    [
                    ListElement { description: "Edge" },
                    ListElement { description: "Pulse" },
                    ListElement { description: "Slope" }
                ]
            }
            ListElement
            {
                label: "Source"
                attributes:
                    [
                    ListElement { description: "CH 1" },
                    ListElement { description: "CH 2" }
                ]
            }
            ListElement
            {
                label: "Coupling"
                attributes:
                    [
                    ListElement { description: "DC" },
                    ListElement { description: "AC" }
                ]
            }
            ListElement
            {
                label: "Mode"
                attributes:
                    [
                    ListElement { description: "Auto" },
                    ListElement { description: "Normal" },
                    ListElement { description: "Single" }
                ]
            }
            ListElement
            {
                label: "Slope"
                attributes:
                    [
                    ListElement { description: "Rise" },
                    ListElement { description: "Fall" },
                    ListElement { description: "Fall" }
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


