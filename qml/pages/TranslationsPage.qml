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
                text: qsTr("GitHub translations")
                onClicked: Qt.openUrlExternally("https://github.com/ruditimmermans/harbour-fileman/tree/main/translations")
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
                title: "Portugees"
                labelData: [ "Rafaelvlmendes" ]
            }
            CollaboratorsLabel {
                title: "Chinese"
                labelData: [ "Dashinfantry" ]
            }
            CollaboratorsLabel {
                title: "Spanish"
                labelData: [ "Carmenfdezb" ]
            }
            CollaboratorsLabel {
                title: "German"
                labelData: [ "Inta" ]
            }
            CollaboratorsLabel {
                title: "Swedish"
                labelData: [ "Eson" ]
            }
            CollaboratorsLabel {
                title: "Polish"
                labelData: [ "Atlochowski" ]
            }
            CollaboratorsLabel {
                title: "Italian"
                labelData: [ "Fravaccaro" ]
            }
            CollaboratorsLabel {
                title: "Portuguese (Brazil)"
                labelData: [ "Marreko" ]
            }
        }
    }
}
