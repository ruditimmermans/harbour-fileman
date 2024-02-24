import QtQuick 2.5
import Sailfish.Silica 1.0

PullDownMenu {
    id: pullDownMenu
    MenuItem {
        text: qsTr("Settings")
        visible: 'isShortcutsPage' in getDirectoryView() ? true : false
        onClicked: pageStack.push(Qt.resolvedUrl("../SettingsPage.qml"))
    }
    MenuItem {
        text: qsTr("Global search")
        visible: 'isShortcutsPage' in getDirectoryView() ? true : false
        onClicked: pageStack.push(Qt.resolvedUrl("../SearchPage.qml"))
    }
    MenuItem {
        text: qsTr("New folder")
        visible: 'isShortcutsPage' in getDirectoryView() ? false : true
        onClicked: getDirectoryPage().addNewFiles()
    }
    MenuItem {
        text: qsTr("Search in directory")
        visible: 'isShortcutsPage' in getDirectoryView() ? false : true
        enabled: fileModel.count > 1 ? true : false
        onClicked: pageStack.push(Qt.resolvedUrl("../SearchPage.qml"),
                                 { dir: settings.dirPath });
    }
    MenuItem {
        text: qsTr("Places")
        visible: 'isShortcutsPage' in getDirectoryView() ? false : true
        onClicked: getDirectoryPage().openShortcuts()
    }

function updatesHiddenFilesOptions() {

    if ('isShortcutsPage' in getDirectoryView())
        return

    if (settings.showHiddenFiles == true) {
          dontHidden.visible = true
          showHidden.visible = false
    } else {
          dontHidden.visible = false
          showHidden.visible = true
    }
  }

function updatesHeaderOptions() {

    if ('isShortcutsPage' in getDirectoryView())
        return

    if (settings.showDirHeader == true) {
          hiddenShowHeader.visible = true
          showHeader.visible = false
    } else {
          hiddenShowHeader.visible = false
          showHeader.visible = true
    }
  }
}
