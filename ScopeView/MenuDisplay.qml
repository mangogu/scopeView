import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Rectangle {
    id: rightRect
    color: "black"

    ListView {
        id:list
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
                itemType: "labelCombobox"
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
                itemType: "labelCombobox"
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
                itemType: "labelCombobox"
            }
            ListElement
            {
                key: "last"
                label: "123"
                attributes:
                    [
                    ListElement { description: "Full" },
                    ListElement { description: "Grid" },
                    ListElement { description: "Cross Hair" },
                    ListElement { description: "Frame" }
                ]
                itemType: "labelSpinbox"
            }
        }


        delegate: Item {
            width: parent.width
            implicitHeight: loader.implicitHeight
            Loader {
                id: loader
                width: parent.width
                sourceComponent: switch (itemType) {
                    case "labelCombobox": return labelCombobox
                    case "labelSpinbox": return labelSpinbox
                }
            }

            Component {
                id: labelCombobox
                ColumnLayout {
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

            Component {
                id: labelSpinbox
                ColumnLayout {
                    width: parent.width
                    Label {
                        text: label
                        Layout.preferredWidth: parent.width/2
                    }
                    SpinBox {
                        value: 0
                        Layout.fillWidth: true
                    }
                }
            }
        }



    }
}



