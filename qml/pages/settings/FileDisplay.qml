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
                title: qsTr("File display")
            }

            SectionHeader {
                id: directoryLookHeader
                text: qsTr("File display look")
            }          

            Slider {
                id: overlayTimeSlider

                width: parent.width

                minimumValue: 1
                maximumValue: 5
                stepSize: 0.25

                handleVisible: true

                value: settings.fileOverlayPeriod
                valueText: value
                onReleased: settings.fileOverlayPeriod = value
                label: qsTr("Overlay visibility (seconds)")
            }

            TextSwitch {
                text: qsTr("Browse through all files")
                description: qsTr("When viewing a file, browse through all viewable files instead of files with the same file type")
                checked: settings.browseAllFileTypes
                onCheckedChanged: settings.browseAllFileTypes = checked
            }

            TextSwitch {
                text: qsTr("Display black background")
                description: qsTr("Display a black background when viewing image and video files")
                checked: settings.showBlackBackground
                onCheckedChanged: settings.showBlackBackground = checked
            }
        }
    }
}
