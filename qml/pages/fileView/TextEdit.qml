import QtQuick 2.5
import Sailfish.Silica 1.0

Page  {
    id: page

    allowedOrientations: Orientation.All

    showNavigationIndicator: false

    // Current displayed file
    property var fileEntry: null

    RemorsePopup { id: remorsePopup }

    SilicaFlickable {
        anchors.fill: parent

        contentHeight: textArea.height

        PullDownMenu {
            MenuItem {
                text: qsTr("Go back")
                onClicked: pageStack.pop()
            }
            MenuItem {
                text: qsTr("Clear")
                onClicked: remorsePopup.execute(qsTr("Clearing text area"), function() { textArea.text = "" })
            }
            MenuItem {
                text: qsTr("Save")
                onClicked: remorsePopup.execute(qsTr("Saving file"), function() { fileInfo.setFileContent(fileEntry.fullPath, textArea.text) })
            }
        }

        TextArea {
            id: textArea

            anchors.left: parent.left
            anchors.right: parent.right

            focus: true

            font.family: "monospace"
            font.pixelSize: Theme.fontSizeTiny

            text: fileInfo.getFileContent(fileEntry.fullPath)
        }
    }
}
