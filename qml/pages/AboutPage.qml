import QtQuick 2.2
import Sailfish.Silica 1.0
import "./components"

Page {
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: aboutColumn.height

        VerticalScrollDecorator {}

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
                onClicked: { Qt.openUrlExternally("https://www.twitter.com/xray20001");
                }
            }

            IconTextButton {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Donate with Paypal")
                iconSource: "qrc:/images/paypal"
                onClicked: { Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=29THE9VFMZ4PS");
                }
            }

            SectionHeader { text: qsTr("Icons") }
            TextLabel { labelText: qsTr("Fileman icons made by Molan and levone1.") }

            SectionHeader { text: qsTr("Version") }
            TextLabel { labelText: mainWindow.appName + " v" + mainWindow.version }

            Item { width: parent.width; height: Theme.itemSizeMedium } //Spacer
        }
    }
}
