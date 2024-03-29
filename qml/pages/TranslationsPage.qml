import QtQuick 2.5
import Sailfish.Silica 1.0
import "./components"

Page
{
    id: developerspage
        allowedOrientations: Orientation.All

    SilicaFlickable
    {
        anchors.fill: parent
        contentHeight: content.height

        VerticalScrollDecorator {}

        PullDownMenu
        {
            MenuItem
            {
                text: qsTr("POEditor translations")
                onClicked: Qt.openUrlExternally("https://poeditor.com/join/project/NkPuDWFCn1")
            }
        }

        Column
        {
            id: content
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader
            {
                id: pageheader
                title: qsTr("Fileman translators")
            }

            CollaboratorsLabel {
                title: "Spanish"
                labelData: [ "Carmenfdezb" ]
            }
            CollaboratorsLabel {
                title: "German"
                labelData: [ "Fingus" ]
            }
            CollaboratorsLabel {
                title: "Swedish"
                labelData: [ "Eson" ]
            }
        }
    }
}
