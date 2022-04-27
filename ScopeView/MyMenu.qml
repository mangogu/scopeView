import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Item {
    id: drawerFrame
    anchors.fill: parent

    Loader{
        id: myloader
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: leftRect.right

    }

    Rectangle {
        id: leftRect
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width/4
        color: "black"
        ListView {
            onCurrentIndexChanged: myloader.source = getloader()
            id: list
            anchors.fill: parent
            interactive: false

            function getloader()
            {
                if (currentIndex == 0)
                {
                    return "/MenuCH1.qml"
                }
                else if (currentIndex == 1){
                    return "/MenuCH2.qml"
                }
//                else if (currentIndex == 2){
//                    return "/MenuTrigger.qml"
//                }
//                else if (currentIndex == 3){
//                    return "/MenuTrigger.qml"
//                }
//                else if (currentIndex == 4){
//                    return "/MenuTrigger.qml"
//                }
            }

            model: ListModel {
                ListElement {
                    name: "CH 1"
                    iconSource: "qrc:/icons/icon_1.svg"
                    //iconSource:
                }
                ListElement {
                    name: "CH 2"
                    iconSource: "qrc:/icons/icon_2.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Trigger"
                    iconSource: "qrc:/icons/icon_trigger.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Measure"
                    iconSource: "qrc:/icons/icon_measure.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Cursor"
                    iconSource: "qrc:/icons/icon_cursor.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Display"
                    iconSource: "qrc:/icons/icon_storage.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Utility"
                    iconSource: "qrc:/icons/icon_storage.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Measure"
                    iconSource: "qrc:/icons/icon_storage.svg"
                    //iconSource:
                }
            }

            highlightFollowsCurrentItem: false

            highlight: Component {
                id: highlight
                Rectangle {
                    width: 10
                    height: leftRect.height/8
                    color: "white"
                    opacity: 0.5
                    y: list.currentItem.y
                    Behavior on y {
                        SpringAnimation {
                            spring: 10
                            damping: 0.5
                            mass: 1
                        }
                    }
                }
            }

            delegate: Button {
                id: button
                width: parent.width
                text: name
                height: leftRect.height/8
                icon.height: 20
                icon.width: 20
                icon.source: iconSource
                display: AbstractButton.TextUnderIcon
                onReleased: {
                    list.currentIndex = index
                }
            }
        }
    }

}
