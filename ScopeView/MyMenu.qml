import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12
import Inifileoperate 1.0

Item {
    id: drawerFrame
    anchors.fill: parent
    property alias menuList: menuList

    //rightRect
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
            id: menuList
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            model: getList()//getList()

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
                            id: comboboxId
                            model: attributes
                            Layout.fillWidth: true
                            property bool initialized: false
                            onCurrentTextChanged: {
                                if(comboboxId.initialized === true) {
                                    Inifileoperate.setValue(leftList.currentItem.text,label,comboboxId.currentText)
                                    console.log(leftList.currentItem.text," ",label," ",comboboxId.currentText)
                                }
                            }

                            Component.onCompleted: {
                                currentIndex = find(Inifileoperate.getValue(leftList.currentItem.text,label))
                                comboboxId.initialized = true
                            }
                        }
                        Component.onCompleted: {
                            //配置
                            //Inifileoperate.setValue(leftList.currentItem.text,label,comboboxId.currentText)
                            //console.log(leftList.currentItem.text," = ",Inifileoperate.getValue(leftList.currentItem.text,label))
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

            //获取列表
            function getList()
            {
                if (leftList.currentIndex === 0){
                    return ch1Content
                }
                else if (leftList.currentIndex === 1){
                    return ch2Content
                }
                else if (leftList.currentIndex === 2){
                    return triggerContent
                }
                else if (leftList.currentIndex === 3){
                    return measureContent
                }
                else if (leftList.currentIndex === 4){
                    return cursorContent
                }
                else if (leftList.currentIndex === 5){
                    return acquireContent
                }
                else if (leftList.currentIndex === 6){
                    return displayContent
                }
                //                else if (leftList.currentIndex === 7){
                //                    return storageContent
                //                }
                //                else if (leftList.currentIndex === 8){
                //                    return utilityContent
                //                }
            }

            //CH1 菜单内容
            ListModel {
                id: ch1Content
                ListElement
                {
                    label: "Coupling"
                    attributes:
                        [
                        ListElement { description: "DC 1MΩ" },
                        ListElement { description: "AC 1MΩ" },
                        ListElement { description: "GND" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "BW Limit"
                    attributes:
                        [
                        ListElement { description: "FULL" },
                        ListElement { description: "20MHz" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Volts/Div"
                    attributes:
                        [
                        ListElement { description: "Coarse" },
                        ListElement { description: "Fine" }
                    ]
                    itemType: "labelCombobox"
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
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Invert"
                    attributes:
                        [
                        ListElement { description: "Off" },
                        ListElement { description: "On" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Unit"
                    attributes:
                        [
                        ListElement { description: "V" },
                        ListElement { description: "A" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            //CH2 菜单内容
            ListModel {
                id: ch2Content
                ListElement
                {
                    label: "Coupling"
                    attributes:
                        [
                        ListElement { description: "DC 1MΩ" },
                        ListElement { description: "AC 1MΩ" },
                        ListElement { description: "GND" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "BW Limit"
                    attributes:
                        [
                        ListElement { description: "FULL" },
                        ListElement { description: "20MHz" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Volts/Div"
                    attributes:
                        [
                        ListElement { description: "Coarse" },
                        ListElement { description: "Fine" }
                    ]
                    itemType: "labelCombobox"
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
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Invert"
                    attributes:
                        [
                        ListElement { description: "Off" },
                        ListElement { description: "On" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Unit"
                    attributes:
                        [
                        ListElement { description: "V" },
                        ListElement { description: "A" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            //trigger 菜单内容
            ListModel {
                id: triggerContent
                ListElement
                {
                    label: "Type"
                    attributes:
                        [
                        ListElement { description: "Edge" },
                        ListElement { description: "Pulse" },
                        ListElement { description: "Slope" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Source"
                    attributes:
                        [
                        ListElement { description: "CH 1" },
                        ListElement { description: "CH 2" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Coupling"
                    attributes:
                        [
                        ListElement { description: "DC" },
                        ListElement { description: "AC" }
                    ]
                    itemType: "labelCombobox"
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
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Slope"
                    attributes:
                        [
                        ListElement { description: "Rise" },
                        ListElement { description: "Fall" },
                        ListElement { description: "Rise-Fall" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            //measure 菜单内容
            ListModel {
                id: measureContent
                ListElement
                {
                    label: "MasterSrc"
                    attributes:
                        [
                        ListElement { description: "CH 1" },
                        ListElement { description: "CH 2" },
                        ListElement { description: "MATH" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "SlaveSrc"
                    attributes:
                        [
                        ListElement { description: "CH 1" },
                        ListElement { description: "CH 2" },
                        ListElement { description: "MATH" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "All Para"
                    attributes:
                        [
                        ListElement { description: "Off" },
                        ListElement { description: "On" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            //cursor 菜单内容
            ListModel {
                id: cursorContent
                ListElement
                {
                    label: "Type"
                    attributes:
                        [
                        ListElement { description: "Off" },
                        ListElement { description: "On" }
                    ]
                    itemType: "labelCombobox"
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
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "V Units"
                    attributes:
                        [
                        ListElement { description: "Second" },
                        ListElement { description: "Hertz" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            //acquire 菜单内容
            ListModel {
                id: acquireContent
                ListElement
                {
                    label: "Mode"
                    attributes:
                        [
                        ListElement { description: "Normal" },
                        ListElement { description: "Peak" },
                        ListElement { description: "High Res" },
                        ListElement { description: "Average" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Acquire Mode"
                    attributes:
                        [
                        ListElement { description: "Equivalent" },
                        ListElement { description: "Real-time" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "FastAcq"
                    attributes:
                        [
                        ListElement { description: "Coarse" },
                        ListElement { description: "Fine" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            //display 菜单内容
            ListModel {
                id: displayContent
                ListElement
                {
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
                    label: "Wave Intensity"
                    value: 100
                    itemType: "labelSpinbox"
                }
                ListElement
                {
                    label: "Grid Bright"
                    value: 100
                    itemType: "labelSpinbox"
                }
                ListElement
                {
                    label: "BackLight"
                    value: 100
                    itemType: "labelSpinbox"
                }
                ListElement
                {
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
            }

            //storage 菜单内容
            ListModel {
                id: storageContent
                ListElement
                {
                    label: "Mode"
                    attributes:
                        [
                        ListElement { description: "Normal" },
                        ListElement { description: "Peak" },
                        ListElement { description: "High Res" },
                        ListElement { description: "Average" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Acquire Mode"
                    attributes:
                        [
                        ListElement { description: "Equivalent" },
                        ListElement { description: "Real-time" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "FastAcq"
                    attributes:
                        [
                        ListElement { description: "Coarse" },
                        ListElement { description: "Fine" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            //utility 菜单内容
            ListModel {
                id: utilityContent
                ListElement
                {
                    label: "Mode"
                    attributes:
                        [
                        ListElement { description: "Normal" },
                        ListElement { description: "Peak" },
                        ListElement { description: "High Res" },
                        ListElement { description: "Average" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "Acquire Mode"
                    attributes:
                        [
                        ListElement { description: "Equivalent" },
                        ListElement { description: "Real-time" }
                    ]
                    itemType: "labelCombobox"
                }
                ListElement
                {
                    label: "FastAcq"
                    attributes:
                        [
                        ListElement { description: "Coarse" },
                        ListElement { description: "Fine" }
                    ]
                    itemType: "labelCombobox"
                }
            }
        }
    }



    Rectangle {
        id: leftRect
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: parent.width/4
        color: "black"
        ListView {
            id: leftList
            anchors.fill: parent

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
                    name: "Acquire"
                    iconSource: "qrc:/icons/icon_acquire.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Display"
                    iconSource: "qrc:/icons/icon_display.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Storage"
                    iconSource: "qrc:/icons/icon_storage.svg"
                    //iconSource:
                }
                ListElement {
                    name: "Utility"
                    iconSource: "qrc:/icons/icon_utility.svg"
                    //iconSource:
                }
            }

            highlightFollowsCurrentItem: false

            highlight: Component {
                id: highlight
                Rectangle {
                    width: 5
                    height: leftRect.height/8
                    color: "white"
                    opacity: 0.5
                    y: leftList.currentItem.y
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
                text: name
                width: parent.width
                height: leftRect.height/8
                icon {
                    height: 30
                    width: 30
                    source: iconSource
                }
                display: AbstractButton.TextUnderIcon
                onReleased: {
                    leftList.currentIndex = index
                }
            }
        }
    }

}
