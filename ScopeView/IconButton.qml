import QtQuick 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
RowLayout {
    id:control
    spacing: 0
    property var leftText: "A"
    property var rightText: "Button"
    property var leftColor: "red"

    Label {
        id: left
        color: "white"
        Layout.preferredHeight: control.height
        Layout.preferredWidth: control.height
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: leftText
        elide: Text.ElideRight
        background: Rectangle {
            anchors.fill: parent
            color: leftColor
            opacity: 0.5
        }
    }
    Button {
        id: right
        Layout.preferredHeight: control.height
        Layout.fillWidth: true
        text: rightText
    }
}
