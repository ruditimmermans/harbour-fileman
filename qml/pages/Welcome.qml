import QtQuick 2.5
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0
import harbour.fileman.settings 1.0
import "./components"


Dialog {
    id: disclaimer

    allowedOrientations: Orientation.All

    Component.onCompleted: {
        settings.set_accepted_status(false);
    }

    SettingsObject {
        id: settings
    }

    SilicaFlickable {
        id: disclaimerFlick
        anchors.fill: parent
        contentHeight: disclaimerCol.height + disclaimerHeader.height

        VerticalScrollDecorator { flickable: disclaimerFlick; page: disclaimer }

        DialogHeader {
            id: disclaimerHeader
            title: qsTr("Welcome to Fileman.")
            dialog: disclaimer
            flickable: disclaimerFlick
        }

        Column {
            id: disclaimerCol
            anchors { left: parent.left; right: parent.right; top: disclaimerHeader.bottom }
            spacing: Theme.paddingMedium

            Text {
                anchors { left: parent.left; right: parent.right; leftMargin: Theme.horizontalPageMargin; rightMargin: Theme.horizontalPageMargin }
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
                text: qsTr("Fileman is a File Manager for Sailfish OS.")
                wrapMode: Text.WordWrap
            }

            Text {
                anchors { left: parent.left; right: parent.right; leftMargin: Theme.horizontalPageMargin; rightMargin: Theme.horizontalPageMargin }
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
                text: qsTr("Fileman is free software released under the GNU General Public License (GPL), version 3 or later.")
                wrapMode: Text.WordWrap
            }
        }
    }

    acceptDestinationReplaceTarget: Qt.resolvedUrl("BackPage.qml")

    onAccepted: settings.set_accepted_status(true)
    onRejected: Qt.quit()
}
