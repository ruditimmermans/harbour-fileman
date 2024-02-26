import QtQuick 2.5
import Sailfish.Silica 1.0

PullDownMenu {
    id: pullDownMenu
    MenuItem {
        text: qsTr("About Fileman")
        onClicked: pageStack.push(Qt.resolvedUrl("../AboutPage.qml"))
    }
    MenuItem {
         text: qsTr("Fileman translations")
         onClicked: pageStack.push(Qt.resolvedUrl("../TranslationsPage.qml"))
        }
    MenuItem {
        text: qsTr("Settings")
        onClicked: pageStack.push(Qt.resolvedUrl("../SettingsPage.qml"))
    }
}

