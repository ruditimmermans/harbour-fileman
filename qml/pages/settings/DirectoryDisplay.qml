import QtQuick 2.5
import Sailfish.Silica 1.0

Page {

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator {}

        Column {
            id: column
            spacing: Theme.paddingLarge
            width: parent.width
            PageHeader {
                title: qsTr("Directory display")
            }

            SectionHeader {
                id: directoryLookHeader
                text: qsTr("Directory display look")
            }
            TextSwitch {
                text: settings.showHiddenFiles ? qsTr("Show hidden files") : qsTr("Don't show hidden files")
                description: qsTr("View hidden files and folders")
                checked: settings.showHiddenFiles
                onCheckedChanged: settings.showHiddenFiles = checked
            }

            TextSwitch {
                text: settings.showDirHeader ? qsTr("Show path into the dir header") : qsTr("Don't show path into the dir header")
                description: qsTr("Show the path in the dir header")
                checked: settings.showDirHeader
                onCheckedChanged: settings.showDirHeader = checked
            }
        }
    }
}
