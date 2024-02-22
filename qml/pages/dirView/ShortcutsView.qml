import QtQuick 2.5
import Sailfish.Silica 1.0
import "../../js/directoryViewModel.js" as DirectoryViewModel
import "../../js/misc.js" as Misc

SilicaListView {
    id: shortcutsView

    width: parent.width
    height: parent.height

    property bool isShortcutsPage: true

    property bool destroyAfterTransition: false

    VerticalScrollDecorator { }

    DirectoryPullDownMenu { }

    model: listModel

    header: PageHeader {
        title: qsTr("Places")
    }

    delegate: Component {
        id: listItem

        BackgroundItem {
            id: iconButton
            width: shortcutsView.width
            height: Screen.height / 12

            onClicked: getDirectoryPage().openDirectory(model.location)

            Image {
                id: image
                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingMedium
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: height

                source: model.thumbnail
            }
            Label {
                id: shortcutLabel

                width: parent.width / 1.5

                anchors.left: image.right
                anchors.leftMargin: 5
                anchors.top: parent.top
                anchors.topMargin: model.location == model.name ? (parent.height / 2) - (height / 2) : 5

                font.pixelSize: model.location == model.name ? Theme.fontSizeExtraSmall : Theme.fontSizeSmall

                text: model.name
                truncationMode: TruncationMode.Fade
            }
            Rectangle {
                anchors.fill: parent
                opacity: iconButton.down == true || iconButton.pressed == true ? 0.5 : 0
                color: Theme.secondaryHighlightColor
            }
            Text {
                anchors.left: image.right
                anchors.leftMargin: Theme.paddingSmall
                anchors.top: shortcutLabel.bottom
                anchors.topMargin: 2

                font.pixelSize: Theme.fontSizeExtraSmall
                color: Theme.secondaryColor

                text: model.location

                visible: model.location == model.name ? false : true
            }
            IconButton {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge

                width: Theme.itemSizeSmall
                height: Theme.itemSizeSmall

                visible: model.bookmark ? true : false

                icon.source: "image://theme/icon-m-close"

                onClicked: {
                    if (!model.bookmark)
                        return

                    settings.removeBookmarkPath(model.location)

                    updateModel()
                }
            }
        }
    }

    section {
        property: 'section'

        delegate: SectionHeader {
            text: section
            height: Theme.itemSizeExtraSmall
        }
    }

    ListModel {
        id: listModel
    }

    SmoothedAnimation {
        id: animateCollapseLeft
        target: shortcutsView
        properties: "x"
        from: shortcutsView.x
        to: shortcutsView.x - shortcutsView.width
        duration: 200
        onStopped: if (destroyAfterTransition) shortcutsView.destroy()
    }

    SmoothedAnimation {
        id: animateCollapseRight
        target: shortcutsView
        properties: "x"
        from: shortcutsView.x
        to: shortcutsView.x + shortcutsView.width
        duration: 200
        onStopped: if (destroyAfterTransition) shortcutsView.destroy()
    }

    Component.onCompleted: updateModel()

    /*
     *  Create model entries
     */
    function updateModel()
    {
        listModel.clear()

        // Add locations
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Last location"),
                           "thumbnail": "qrc:/icons/up",
                           "location": settings.dirPath })
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Home"),
                           "thumbnail": "qrc:/icons/home",
                           "location": StandardPaths.home })
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Root"),
                           "thumbnail": "qrc:/icons/root",
                           "location": "/" })
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Documents"),
                           "thumbnail": "qrc:/icons/text",
                           "location": StandardPaths.documents })
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Downloads"),
                           "thumbnail": "qrc:/icons/downloads",
                           "location": StandardPaths.download })
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Music"),
                           "thumbnail": "qrc:/icons/audio",
                           "location": StandardPaths.music })
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Pictures"),
                           "thumbnail": "qrc:/icons/image",
                           "location": StandardPaths.pictures })
        listModel.append({ "section": qsTr("Locations"),
                           "name": qsTr("Videos"),
                           "thumbnail": "qrc:/icons/video",
                           "location": StandardPaths.videos })
        listModel.append({ "section": qsTr("Android location"),
                           "name": qsTr("Android storage"),
                           "thumbnail": "qrc:/icons/android",
                           "location": StandardPaths.home + "/android_storage" })

        // Add SD card if it's mounted
        if (engine.getSdCardMountPath() != "")
        {
            listModel.append({ "section": qsTr("Storage devices"),
                               "name": qsTr("SD-Card"),
                               "thumbnail": "qrc:/icons/sdcard",
                               "location": engine.getSdCardMountPath()})
        }

        // Add bookmarks if there are any
        var bookmarks = settings.getBookmarks()

        for (var key in bookmarks)
        {
            var entry = bookmarks[key];

            listModel.append({ "section": qsTr("Bookmarks"),
                               "name": entry,
                               "thumbnail": "qrc:/icons/bookmarks",
                               "location": key,
                               "bookmark": true })
        }
    }

    function collapseToLeft(destroyAfterCollapse)
    {
        animateCollapseLeft.start()
        destroyAfterTransition = destroyAfterCollapse
    }

    function collapseToRight(destroyAfterCollapse)
    {
        animateCollapseRight.start()
        destroyAfterTransition = destroyAfterCollapse
    }
}
