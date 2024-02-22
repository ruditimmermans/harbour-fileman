import QtQuick 2.5
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: entryLabel
        anchors.bottom: iconLabel.top
        anchors.bottomMargin: Theme.paddingSmall
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingSmall
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingSmall

        horizontalAlignment: Text.AlignHCenter

        wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        text: coverModel.coverLabel

        font.pixelSize: Theme.fontSizeSmall
    }
    Image {
        id: iconLabel

        y: parent.height - (parent.width * 0.75)

        anchors.left: parent.left
        anchors.right: parent.right

        width: parent.width
        height: parent.width

        sourceSize.width: parent.width
        sourceSize.height: parent.width

        source: coverModel.iconSource

        fillMode: Image.PreserveAspectFit
    }
    OpacityRampEffect {
        id: effect
        direction: OpacityRamp.BottomToTop
        slope: 4
        offset: 0.75
        sourceItem: iconLabel
    }

    Connections {
        target: coverModel
        onIconSourceChanged: {
            iconLabel.source = iconSource
            if (iconSource.indexOf("qrc:/icons") !== -1)
                effect.offset = 1
            else
                effect.offset = 0.75
        }
    }
}


