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
                title: qsTr("Root mode")
            }

            SectionHeader {
                    text: qsTr("Root")
                }

            Column {
                width: parent.width
                TextSwitch {
                    text: engine.rootMode ? qsTr("Start into user mode") : qsTr("Start into root mode")
                    checked: engine.rootMode
                    onClicked: engine.rootMode = !engine.rootMode
                    automaticCheck: false
                    }
                }
            }
        }
     }
