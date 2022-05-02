import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.12

Item {
    id: drawerFrame
    anchors.fill: parent
    property alias menuList: menuList

    Component.onCompleted: {
        console.log(menuList.getList())
    }

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

            delegate: ColumnLayout {
                width: parent.width

                Label {
                    id: labelId
                    text: label
                    Layout.preferredWidth: parent.width/2
                }
                ComboBox {
                    id: comboboxId
                    model: attributes
                    Layout.fillWidth: true
                    property bool initialCompleted: false
                    onCurrentTextChanged: {
                        if(initialCompleted) {
                            console.log(labelId.text,":",comboboxId.currentText,",",comboboxId.currentIndex)

                        }
                    }
                    Component.onCompleted: {
                        initialCompleted = true
                    }
                }
                Component.onCompleted: {
                    //设置配置文件路径
                    iniTeleporter.setFileName(iniDir);
                    //配置
                    iniTeleporter.setValue(leftList.currentItem.text,label,comboboxId.currentText)
                    //console.log(iniTeleporter.getValue(leftList.currentItem.text,label))
                }
            }

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
                else if (currentIndex === 5){
                    return "/MenuAcquire.qml"
                }
                else if (currentIndex === 6){
                    return "/MenuDisplay.qml"
                }
                else if (currentIndex === 7){
                    return "/MenuStorage.qml"
                }
                else if (currentIndex === 8){
                    return "/MenuUtility.qml"
                }
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
                    label: "Uint"
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
                    label: "Uint"
                    attributes:
                        [
                        ListElement { description: "V" },
                        ListElement { description: "A" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            ListModel {
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
                        ListElement { description: "Fall" }
                    ]
                    itemType: "labelCombobox"
                }
            }

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
                        ListElement { description: "Fall" }
                    ]
                    itemType: "labelCombobox"
                }
            }

            ListModel {
                id: measureContent
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
                    label: "Uint"
                    attributes:
                        [
                        ListElement { description: "V" },
                        ListElement { description: "A" }
                    ]
                    itemType: "labelCombobox"
                }
            }
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
                }
                ListElement
                {
                    label: "V Units"
                    attributes:
                        [
                        ListElement { description: "Second" },
                        ListElement { description: "Hertz" }
                    ]
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
