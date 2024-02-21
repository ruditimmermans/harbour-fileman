import QtQuick 2.2
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    property variant currentDirectoryView: null
    property bool directoryPageCreated: false

    property var getDirectoryPage: function() {
        return pageStack.find(function(page) { if ('isDirectoryPage' in page) { return true; } else return false; })
    }

    property var getDirectoryView: function() {
        var page = getDirectoryPage()

        if (page.currentView)
            return page.currentView
        else
            return false
    }

    // Get the current file page
    property var getFilePage: function() {
        return pageStack.find(function(page) { if ('isFilePage' in page) { return true; } else return false; })
    }

    // Get the file operation page
    property var getFileOperationPage: function() {
        return pageStack.find(function(page) { if ('isFileOperationPage' in page) { return true; } else return false; })
    }

    // Get the current file view (eg. audio/video/image/text view)
    property var getFileView: function() {
        var page = getFilePage()

        return page.currentView
    }

    property bool selectingItems: false

    id: mainWindow
    allowedOrientations: Orientation.All

    property string appName: "Fileman"
    property string version: "1.0-3"

    initialPage: Qt.resolvedUrl("pages/BackPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
}


