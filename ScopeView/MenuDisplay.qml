import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Rectangle {
    id: rightRect
    color: "black"

    ListView {
        id: listview
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        model:ListModel {
            ListElement
            {
                key: "first"
                label: "Format"
                attributes:
                    [
                    ListElement { description: "Vector" },
                    ListElement { description: "Dots" }
                ]
            }
            ListElement
            {
                key: "middle"
                label: "Persist Time"
                attributes:
                    [
                    ListElement { description: "Off" },
                    ListElement { description: "Auto" },
                    ListElement { description: "Short Persist" },
                    ListElement { description: "Long Persist" },
                    ListElement { description: "Unlimited" }
                ]
            }
            ListElement
            {
                key: "last"
                label: "Graticule"
                attributes:
                    [
                    ListElement { description: "Full" },
                    ListElement { description: "Grid" },
                    ListElement { description: "Cross Hair" },
                    ListElement { description: "Frame" }
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
                id: key
                model: attributes
                Layout.fillWidth: true
            }
        }
    }

}

