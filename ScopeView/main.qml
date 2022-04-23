import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 600
    title: qsTr("ScopeView Beta Version0.1")
    color: "black"
    opacity: 0.98

    //logo
    Image {
        id: logo
        source: "qrc:icons/logo.png"
        opacity: 0.08
        sourceSize.width: 200
        sourceSize.height: 200
        anchors.horizontalCenter: rowLayout.horizontalCenter
        anchors.verticalCenter: rowLayout.verticalCenter
    }

    Drawer {
        id: menu
        width: 0.2 * parent.width
        y: header.height
        height: parent.height - header.height
        //dragMargin: parent.width * 0.1; //拉动开始生效的区域，最低为0，也就是0的位置拖动才有效
        edge: Qt.RightEdge
        dim: false
        opacity: 0.8
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("‹")
                onClicked: menu.open()
            }
            Label {
                text: "ScopeView"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                id: fileButton;
                text: qsTr("⋮")
                onClicked: menu.open()
            }
        }
    }



    ColumnLayout {
        id: rowLayout
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        RowLayout {
            Layout.preferredHeight: parent.height/15
            Layout.preferredWidth: parent.width
            spacing: 4


            IconButton{
                Layout.preferredHeight: parent.height
                Layout.fillWidth: true

                rightText: "Triggered"
                //status
                leftText: "S"
                leftColor: "green"
            }




            IconButton{
                Layout.preferredHeight: parent.height
                Layout.fillWidth: true

                rightText: "500us"

                leftText: "M"
                leftColor: "lightblue"
            }

            Button {
                Layout.preferredHeight: parent.height
                Layout.preferredWidth: 400
                onClicked: menu.open()
            }

            IconButton{
                Layout.preferredHeight: parent.height
                Layout.fillWidth: true

                rightText: "32KPts  20MSa/s"
                //status
                leftText: "S"
                leftColor: "red"
            }

            IconButton{
                Layout.preferredHeight: parent.height
                Layout.fillWidth: true

                rightText: "0.000s"
                //status
                leftText: "D"
                leftColor: "blue"
            }

        }
        RowLayout {

            Layout.fillHeight: true
            Layout.preferredWidth: parent.width

            //            Button {
            //                text: ".."
            //                Layout.preferredHeight: 30
            //                Layout.preferredWidth: 30
            //                icon.source: "qrc:/new/prefix1/wave.svg"
            //                icon.height: 50
            //                icon.width: 50
            //                display: AbstractButton.IconOnly
            //            }
        }
        RowLayout {
            Layout.preferredHeight: parent.height/15
            Layout.preferredWidth: parent.width

            ChannelCtr {
                accentColor: "yellow"
                icon: "qrc:/icons/icon_1.svg"
            }
            ChannelCtr {
                accentColor: "magenta"
                icon: "qrc:/icons/icon_2.svg"

            }
            ChannelCtr {
                accentColor: "cyan"
                icon: "qrc:/icons/icon_3.svg"

            }
            ChannelCtr {
                accentColor: "lightgreen"
                icon: "qrc:/icons/icon_4.svg"

            }

        }
    }

}
