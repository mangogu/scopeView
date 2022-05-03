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

    property int globalGap: window.height/100

//    Inifileoperate {
//        id: iniTeleporter

//        Component.onCompleted: {
//            iniTeleporter.func()
//        }
//    }

    //logo
    Image {
        id: logo
        source: "qrc:icons/logo.png"
        opacity: 0.08
        sourceSize.width: 200
        sourceSize.height: 200
        anchors {
            horizontalCenter: rowLayout.horizontalCenter
            verticalCenter: rowLayout.verticalCenter
        }
    }

    Drawer {
        id: menu
        width: 0.3 * parent.width
        height: parent.height - header.height
        y: header.height
        //dragMargin: parent.width * 0.1; //拉动开始生效的区域，最低为0，也就是0的位置拖动才有效
        edge: Qt.RightEdge
        dim: false
        opacity: 0.8

        MyMenu {

        }
    }


    header: ToolBar {
        id: topBar
        height: parent.height/15
        RowLayout {
            anchors.fill: parent
            ToolButton {
                Layout.preferredHeight: parent.height
                text: qsTr("‹")
                onClicked: menu.open()
            }
            Label {
                Layout.preferredHeight: parent.height
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true

            }
            ToolButton {
                Layout.preferredHeight: parent.height
                id: fileButton;
                //                text: qsTr("⋮")
                onClicked: menu.open()

            }
        }
    }



    ColumnLayout {
        id: rowLayout
        anchors {
            top: topBar.bottom
            bottom: parent.bottom
            left: parent.left
            right:parent.right
        }

        anchors.margins: window.globalGap
        spacing: window.globalGap

        RowLayout {
            Layout.preferredHeight: parent.height/15
            Layout.preferredWidth: parent.width
            spacing: window.globalGap


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

        }
        RowLayout {
            Layout.preferredHeight: parent.height/15
            Layout.preferredWidth: parent.width
            spacing: window.globalGap
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
