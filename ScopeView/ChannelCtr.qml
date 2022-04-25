import QtQuick 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Item {
    id: control
    Layout.preferredHeight: parent.height
    Layout.fillWidth: true

    //通道标志色
    property var accentColor: "yellow"
    //通道图标
    property var icon: "qrc:/icons/icon_1.svg"
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        //除指示条的部分
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            RowLayout {
                anchors.fill: parent
                spacing: 0
                //按钮1：通道开关
                Button {
                    id: channelBtn
                    Layout.fillHeight: true
                    Layout.preferredWidth: this.height
                    icon.source: control.icon//Qt.resolvedUrl("qrc:/icons/icon_1.svg")
                    display: AbstractButton.IconOnly
                    checkable: true
                    onReleased: channelBtn.checked ? change0.start() : acccentRect.startAnimation1()
                    //按钮灰色衬底
                    background: Rectangle {
                        id: base
                        color: channelBtn.pressed  ? Qt.lighter("grey", 1.2) : (channelBtn.hovered ? Qt.darker("grey", 1.2) : "#33FFFFFF")
                        anchors.fill: parent
                        //opacity: channelBtn.pressed  ? 0.4 : (channelBtn.hovered ? 0.3 : 0.2)
                        //按钮重点色前景
                        Rectangle {
                            id: acccentRect
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 0
                            //color: accentColor
                            color: channelBtn.pressed  ? Qt.darker(accentColor, 1.4) : (channelBtn.hovered ? Qt.darker(accentColor, 1.2) : accentColor)

                            function startAnimation1()
                            {
                                change1.start();
                                //取消绑定
                                indicatorLine.anchors.right = undefined
                                acccentRect.anchors.top = undefined
                            }

                            SequentialAnimation {
                                id:change0
                                running: false

                                ParallelAnimation {
                                    NumberAnimation {
                                        target: acccentRect
                                        property: "height"
                                        to: channelBtn.height
                                        duration: 150
                                        easing.type: Easing.InQuad
                                    }

                                    ColorAnimation{
                                        target: channelBtn
                                        property: "icon.color"
                                        to: "black"
                                        duration: 150
                                    }
                                    NumberAnimation{
                                        target: indicatorLine
                                        property: "width"
                                        to: indicatorLineFrame.width
                                        duration: 150
                                    }


                                }
                                PropertyAction {
                                    target: indicatorLine
                                    property: "anchors.right"
                                    value: indicatorLineFrame.right
                                }
                                PropertyAction {
                                    target: acccentRect
                                    property: "anchors.top"
                                    value: base.top
                                }
                            }

                            ParallelAnimation {
                                id:change1
                                running: false
                                NumberAnimation {
                                    target: acccentRect
                                    property: "height"
                                    to: 0
                                    duration: 150
                                    easing.type: Easing.InQuad
                                }

                                ColorAnimation{
                                    target: channelBtn
                                    property: "icon.color"
                                    to: "white"
                                    duration: 150
                                }

                                NumberAnimation{
                                    target: indicatorLine
                                    property: "width"
                                    to: 0
                                    duration: 150
                                }
                            }
                            PropertyAction {
                                target: indicatorLine
                                property: "anchors.right"
                                value: undefined
                            }
                        }
                    }
                }
                //"-"
                Button {
                    Layout.fillHeight: true
                    Layout.preferredWidth: this.height
                    icon.source: "qrc:/icons/icon_minus.svg"
                    display: AbstractButton.IconOnly

                }
                //增益显示
                Button {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text: "50V/Div"
                }
                //"+"
                Button {
                    Layout.fillHeight: true
                    Layout.preferredWidth: this.height
                    icon.source: "qrc:/icons/icon_plus.svg"
                    display: AbstractButton.IconOnly
                }
                //设置按钮
                Button {
                    Layout.fillHeight: true
                    Layout.preferredWidth: this.height
                    icon.source: "qrc:/icons/icon_setting.svg"
                    display: AbstractButton.IconOnly
                    //Universal.accent: "teel"
                    checkable: true
                    onReleased: this.checked ? channelMenu.menuChange0():channelMenu.menuChange1()

                }
            }
        }
        Rectangle {
            id: indicatorLineFrame
            color: channelBtn.pressed  ? Qt.lighter("grey", 1.2) : (channelBtn.hovered ? Qt.darker("grey", 1.2) : "#33FFFFFF")
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            Rectangle {
                id: indicatorLine
                color: channelBtn.pressed  ? Qt.darker(accentColor, 1.4) : (channelBtn.hovered ? Qt.darker(accentColor, 1.2) : accentColor)
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                width: 0
            }
        }
    }
    Rectangle {
        id: channelMenu
        anchors.left: control.left
        anchors.right: control.right
        anchors.bottom: control.top
        height: 200
        border.color: "white"
        border.width: 2
        color: "black"
        opacity: 0
        //visible: false

        ColumnLayout {
            anchors.margins: 10
            anchors.fill: parent
            spacing: 10
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "white"
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "white"
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "white"
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "white"
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "white"
            }

        }

        function menuChange0()
        {
            channelMenu.visible = true
            menuAnimation0.start()
        }

        function menuChange1()
        {
            menuAnimation1.start()
        }


        PropertyAnimation{
            id: menuAnimation0
            target: channelMenu
            property: "opacity"
            to: 0.5
            duration: 150
        }

        SequentialAnimation {
            id: menuAnimation1
            PropertyAnimation{
                target: channelMenu
                property: "opacity"
                to: 0
                duration: 150
            }
            PropertyAnimation{
                target: channelMenu
                property: "visible"
                to: false
                duration: 0
            }
        }
    }
}
