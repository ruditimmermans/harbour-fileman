import QtQuick 2.1
import Sailfish.Silica 1.0
import "./components"

Page {
    id: settingspage

    SilicaFlickable
    {
        anchors.fill: parent
        contentHeight: content.height

        Column
        {
            id: content
            width: parent.width

            PageHeader { title: qsTr("Fileman") }

            SectionHeader { text: qsTr("Settings") }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-file-folder"
                text: qsTr("Directory view")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/DirectoryViewSettings.qml"))
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
                icon: "image://theme/icon-m-display"
                text: qsTr("File display")
                onActionRequested: pageStack.push(Qt.resolvedUrl("settings/FileDisplay.qml"))
            }

            SectionHeader { text: qsTr("General") }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-about"
                text: qsTr("About")
                onActionRequested: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }

            ClickableLabel
            {
                width: parent.width
                height: Theme.itemSizeSmall
                icon: "image://theme/icon-m-region"
                text: qsTr("Translations")
                onActionRequested: pageStack.push(Qt.resolvedUrl("TranslationsPage.qml"))
            }
          }
        }
      }
