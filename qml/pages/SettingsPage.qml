import QtQuick 2.5
import Sailfish.Silica 1.0
import QtQml.Models 2.2
import "./components"

Page {
    id: settingspage
        allowedOrientations: Orientation.All

    SilicaFlickable
    {
        anchors.fill: parent
        contentHeight: content.height

        VerticalScrollDecorator { }

        Column
        {
            id: content
            width: parent.width

            PageHeader { title: qsTr("Settings") }

            SectionHeader { text: qsTr("Fileman root mode") }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-s-developer"
                text: qsTr("Root mode")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/FileRoot.qml"))
            }

            SectionHeader { text: qsTr("Fileman settings") }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-display"
                text: qsTr("File display")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/FileDisplay.qml"))
            }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-transfer"
                text: qsTr("File ordering")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/FileOrderSettings.qml"))
            }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-file-image"
                text: qsTr("Cache thumbnails")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/DirectoryViewSettings.qml"))
            }


            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-file-folder"
                text: qsTr("Directory display")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/DirectoryDisplay.qml"))
            }
          }
        }
      }
