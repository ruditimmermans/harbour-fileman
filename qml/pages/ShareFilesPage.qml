import QtQuick 2.2
import Sailfish.Silica 1.0
import Nemo.FileManager 1.0
import Sailfish.TransferEngine 1.0
import "./components"

Page {
    SilicaFlickable {
        width: parent.width
        height: parent.height

    property string file

    VerticalScrollDecorator {}

    ShareMethodList {
        id: shareMethodList
        anchors.fill: parent
        header: PageHeader {
            TextLabel { labelText: qsTr("Note: You can only share one file at a time. Not multiple ones.") }
        }

        source: "file://" + clipboard.getSelectedFiles()

        content: {
            "data": "file://" + clipboard.getSelectedFiles(),
            "icon": "image://theme/icon-m-file-image"
        }

        ViewPlaceholder {
            enabled: shareMethodList.model.count === 0
            text: qsTr("No sharing accounts available!")
        }
      }
    }
  }

