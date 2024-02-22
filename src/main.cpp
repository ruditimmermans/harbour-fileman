#include <QtQuick>
#include <sailfishapp.h>
#include "thumbnailprovider.h"
#include "settings.h"
#include "filelist.h"
#include "fileengine.h"
#include "covermodel.h"
#include "searchengine.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setSetuidAllowed(true);
    qmlRegisterType<SearchEngine>("harbour.fileman.SearchEngine", 1, 0, "SearchEngine");
    qRegisterMetaType<QList<FileInfoEntry*> >();

    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QQuickView *view = SailfishApp::createView();

    qmlRegisterType<Settings>("harbour.fileman.settings",1,0,"SettingsObject");

    view->engine()->addImageProvider(QLatin1String("thumbnail"), new ThumbnailProvider);

    FileEngine fileEngine;
    view->rootContext()->setContextProperty("engine", &fileEngine);
    view->rootContext()->setContextProperty("fileList", fileEngine.fileList);
    view->rootContext()->setContextProperty("fileInfo", fileEngine.fileInfo);
    view->rootContext()->setContextProperty("fileProcess", fileEngine.fileProcess);
    view->rootContext()->setContextProperty("clipboard", fileEngine.clipboard);
    view->rootContext()->setContextProperty("settings", fileEngine.settings);
    view->rootContext()->setContextProperty("coverModel", fileEngine.coverModel);

    // Show the application
    view->setSource(SailfishApp::pathTo("qml/Fileman.qml"));
    view->show();

    return app->exec();
}

