import QtQuick 2.5
import Sailfish.Silica 1.0
import "./components"

Page {
        allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: aboutColumn.height

        VerticalScrollDecorator {}

        PullDownMenu
        {
            MenuItem
            {
                text: qsTr("GitHub Repository")
                onClicked: Qt.openUrlExternally("https://github.com/ruditimmermans/harbour-fileman")
            }

            MenuItem
            {
                text: qsTr("Report an Issue")
                onClicked: Qt.openUrlExternally("https://github.com/ruditimmermans/harbour-fileman/issues")
            }
        }

        Column {
            id: aboutColumn
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader { title: qsTr("About Fileman") }

            SectionHeader { text: qsTr("What's") + " Fileman?" }
            TextLabel { labelText: qsTr("Fileman is a File Manager for Sailfish OS.") }

            SectionHeader { text: qsTr("Licensing") }
            TextLabel { labelText: "Fileman " + qsTr("is free software released under the GNU General Public License (GPL), version 3 or later.") }

            SectionHeader { text: qsTr("Fileman developer") }

            IconTextButton {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Rudi Timmermans")
                iconSource: "qrc:/images/developer"
                onClicked: { Qt.openUrlExternally("https://github.com/ruditimmermans");
                }
            }

            IconTextButton {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Donate with Paypal")
                iconSource: "qrc:/images/paypal"
                onClicked: { Qt.openUrlExternally("https://www.paypal.com/donate?hosted_button_id=K85Y233EKB5N4");
                }
            }

            SectionHeader { text: qsTr("Translators") }

            IconTextButton {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Fileman Translations")
                iconSource: "qrc:/images/trans"
                onClicked: pageStack.push(Qt.resolvedUrl("TranslationsPage.qml"))
            }

            SectionHeader { text: qsTr("Icons") }
            TextLabel { labelText: qsTr("Fileman icons made by Gregguh.") }

            SectionHeader { text: qsTr("Thanking") }
            TextLabel { labelText: qsTr("Thanks to Velox for the help on the Search function.") }

            SectionHeader { text: qsTr("Bèta testing") }
            TextLabel { labelText: qsTr("Thanks to Eson for the beta testing.") }

            SectionHeader { text: qsTr("Version") }
            TextLabel { labelText: mainWindow.appName + " v" + mainWindow.version }

            Item { width: parent.width; height: Theme.itemSizeMedium } //Spacer
        }
    }
}
