import QtQuick 2.2
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
                title: qsTr("File display")
            }

            SectionHeader {
                id: directoryLookHeader
                text: qsTr("File display look")
            }

            TextSwitch {
                text: qsTr("Browse through all files")
                description: qsTr("When viewing a file, browse through all viewable files instead of files with the same file type")

                checked: settings.browseAllFileTypes

                onCheckedChanged: settings.browseAllFileTypes = checked
            }
        }
    }
}
