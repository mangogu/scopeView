import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Rectangle {
    id: rightRect
    color: "black"
    anchors {
        right: parent.right
        top: parent.top
        bottom: parent.bottom
        left: leftRect.right
    }

    ListView {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        model: ch1Content

            ListModel {
            id:ch1Content
            ListElement
            {
                label: "Coupling"
                attributes:
                    [
                    ListElement { description: "DC 1MΩ" },
                    ListElement { description: "AC 1MΩ" },
                    ListElement { description: "GND" }
                ]
            }
            ListElement
            {
                label: "BW Limit"
                attributes:
                    [
                    ListElement { description: "FULL" },
                    ListElement { description: "20MHz" }
                ]
            }
            ListElement
            {
                label: "Volts/Div"
                attributes:
                    [
                    ListElement { description: "Coarse" },
                    ListElement { description: "Fine" }
                ]
            }
            ListElement
            {
                label: "Probe"
                attributes:
                    [
                    ListElement { description: "1x" },
                    ListElement { description: "10x" },
                    ListElement { description: "100x" }
                ]
            }
            ListElement
            {
                label: "Invert"
                attributes:
                    [
                    ListElement { description: "Off" },
                    ListElement { description: "On" }
                ]
            }
            ListElement
            {
                label: "Uint"
                attributes:
                    [
                    ListElement { description: "V" },
                    ListElement { description: "A" }
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
