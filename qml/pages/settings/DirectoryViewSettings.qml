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
                title: qsTr("Directory view")
            }

            SectionHeader {
                id: directoryLookHeader
                text: qsTr("Thumbnails")
            }

            Column {
                width: parent.width
            }

            Column {
                // No spacing in this column
                width: parent.width
                TextSwitch {
                    text: qsTr("Display thumbnails")
                    description: qsTr("Display thumbnails for image files")

                    checked: settings.displayThumbnails

                    onCheckedChanged: settings.displayThumbnails = checked
                }
                TextSwitch {
                    text: qsTr("Cache thumbnails")
                    description: qsTr("Save generated thumbnails for faster loading")

                    checked: settings.cacheThumbnails

                    onCheckedChanged: settings.cacheThumbnails = checked
                }
            }
        }
    }
 }
