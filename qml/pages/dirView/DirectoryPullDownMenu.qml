import QtQuick 2.5
import Sailfish.Silica 1.0

PullDownMenu {
    id: pullDownMenu
    MenuItem {
        text: qsTr("Global search")
         onClicked: pageStack.push(Qt.resolvedUrl("../SearchPage.qml"))
    }
    MenuItem {
        text: qsTr("Search in directory")
        enabled: fileModel.count > 1 ? true : false
        onClicked: pageStack.push(Qt.resolvedUrl("../SearchPage.qml"),
                                 { dir: settings.dirPath });
    }
    MenuItem {
        text: qsTr("New folder")
        onClicked: getDirectoryPage().addNewFiles()
    }
    MenuItem {
        text: qsTr("Places")
        onClicked: getDirectoryPage().openShortcuts()
    }
}
