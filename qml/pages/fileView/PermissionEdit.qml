import QtQuick 2.5
import Sailfish.Silica 1.0

Item {
    id: rootItem

    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right

    property string permissionString: "---------"
    property string fullPath: ""

    height: listView.contentHeight

    SilicaListView {
        id: listView

        anchors.left: parent.left
        anchors.right: parent.right

        interactive: false

        height: contentHeight

        model: listModel

        section {
            property: 'section'

            delegate: SectionHeader {
                text: section
                height: Theme.itemSizeExtraSmall
            }
        }

        delegate: Item {
            width: parent.width
            height: Theme.itemSizeExtraSmall

            Label {
                id: label
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingLarge

                horizontalAlignment: Text.AlignLeft

                text: model.text
            }
            Switch {
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge

                anchors.verticalCenter: label.verticalCenter

                automaticCheck: false
                checked: permissionString.substring(model.stringPos, model.stringPos+1) != "-" ? true : false

                onClicked: {
                    var success = engine.changeFilePermission(fullPath, model.stringPos)

                    if (success)
                        checked = !checked
                }
            }


        }

        ListModel {
            id: listModel
        }

    }

    onFullPathChanged: {
        updateFilePermissions()
    }

    function updateFilePermissions()
    {
        if (fullPath == "")
            return

        permissionString = fileList.getFilePermissions(fullPath, true)

        listModel.clear()

        listModel.append({ "section": qsTr("User permissions"),
                           "text": qsTr("Read"),
                           "stringPos": 0 })
        listModel.append({ "section": qsTr("User permissions"),
                           "text": qsTr("Write"),
                           "stringPos": 1 })
        listModel.append({ "section": qsTr("User permissions"),
                           "text": qsTr("Execute"),
                           "stringPos": 2 })
        listModel.append({ "section": qsTr("Group permissions"),
                           "text": qsTr("Read"),
                           "stringPos": 3 })
        listModel.append({ "section": qsTr("Group permissions"),
                           "text": qsTr("Write"),
                           "stringPos": 4 })
        listModel.append({ "section": qsTr("Group permissions"),
                           "text": qsTr("Execute"),
                           "stringPos": 5 })
        listModel.append({ "section": qsTr("Owner permissions"),
                           "text": qsTr("Read"),
                           "stringPos": 6 })
        listModel.append({ "section": qsTr("Owner permissions"),
                           "text": qsTr("Write"),
                           "stringPos": 7 })
        listModel.append({ "section": qsTr("Owner permissions"),
                           "text": qsTr("Execute"),
                           "stringPos": 8 })
    }
}
