import QtQuick 2.2
import Sailfish.Silica 1.0
import harbour.fileman.settings 1.0

// A placeholder page that is shown while the actual directory view is loaded or when the application is started
Page {
    id: page

    allowedOrientations: Orientation.All

    property bool appStarted: false
    property bool accepted: settings.get_accepted_status()

    SettingsObject {
        id: settings
    }

    Timer {
        interval: 50
        running: accepted && !updated ? false : true
        repeat: true
        triggeredOnStart: true
        onTriggered: { stop()
            settings.clean_conf()
            console.log("accepted "+accepted)
            pageStack.push(Qt.resolvedUrl("Welcome.qml"))
        }
    }

    onStatusChanged: {
        if (status == PageStatus.Activating) {
            if (appStarted)
                settings.cdUp()
            else
                appStarted = true
        }

        if (status == PageStatus.Active) pageStack.push(Qt.resolvedUrl("DirectoryPage.qml"), null, PageStackAction.Immediate)
    }

    // Directory title header
    SilicaListView {
        anchors.fill: parent

        PullDownMenu { }

        header: Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: Theme.itemSizeLarge

            Label {
                id: headerLabel

                text: settings.dirPath

                anchors.left: parent.left
                anchors.leftMargin: Theme.paddingMedium
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingLarge

                color: Theme.highlightColor

                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter

                height: settings.showDirHeader == true ? Theme.itemSizeLarge : 0

                visible: settings.showDirHeader
            }
            OpacityRampEffect {
                direction: OpacityRamp.RightToLeft
                slope: 4
                offset: 0.75
                sourceItem: headerLabel
            }
        }
    }
}
