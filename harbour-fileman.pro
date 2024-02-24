TARGET = harbour-fileman

i18n.path = /usr/share/harbour-fileman/translations
i18n.files = translations/harbour-fileman-de.qm \
             translations/harbour-fileman-es.qm \
             translations/harbour-fileman-it.qm \
             translations/harbour-fileman-nl.qm \
             translations/harbour-fileman-fr.qm \
             translations/harbour-fileman-sv.qm \
             translations/harbour-fileman-pl.qm \
             translations/harbour-fileman-pt_BR.qm \
             translations/harbour-fileman-zh_CN.qm \
             translations/harbour-fileman-fi.qm

INSTALLS += i18n

# automatic generation of the translation .qm files from .ts files
system(lrelease $$PWD/translations/*.ts)

CONFIG += sailfishapp

QT += multimedia

SOURCES += \
    src/thumbnailprovider.cpp \
    src/settings.cpp \
    src/filelist.cpp \
    src/iconprovider.cpp \
    src/fileengine.cpp \
    src/fileinfoentry.cpp \
    src/fileinfo.cpp \
    src/fileprocess.cpp \
    src/worker.cpp \
    src/clipboard.cpp \
    src/main.cpp \
    src/covermodel.cpp \
    src/util.cpp \
    src/searchengine.cpp \
    src/statfileinfo.cpp \
    src/globals.cpp \
    src/searchworker.cpp \
    src/directoryworker.cpp

DISTFILES += \
    qml/cover/CoverPage.qml \
    rpm/harbour-fileman.yaml \
    rpm/harbour-fileman.spec \
    harbour-fileman.desktop \
    qml/pages/SettingsPage.qml \
    qml/pages/ImageView.qml \
    qml/js/directoryViewModel.js \
    qml/pages/dirView/DirectoryPullDownMenu.qml \
    qml/pages/dirView/DirectoryPushUpMenu.qml \
    qml/pages/settings/DirectoryViewSettings.qml \
    qml/pages/dirView/DirectoryListView.qml \
    qml/pages/dirView/DirectoryGridView.qml \
    qml/js/misc.js \
    qml/pages/settings/FileOrderSettings.qml \
    qml/pages/AboutPage.qml \
    qml/pages/TranslationsPage.qml \
    qml/pages/Welcome.qml \
    qml/pages/fileView/FileInfo.qml \
    qml/js/imageView.js \
    qml/js/functions.js \
    qml/pages/components/ClickableLabel.qml \
    qml/pages/components/IconTextButton.qml \
    qml/pages/components/TextLabel.qml \
    qml/pages/components/CollaboratorsLabel.qml \
    qml/pages/components/NotificationPanel.qml \
    qml/pages/components/ProgressPanel.qml \
    qml/pages/components/SelectionPanel.qml \
    qml/pages/components/InteractionBlocker.qml \
    qml/pages/components/Spacer.qml \
    qml/pages/components/MyHighlightImage3.qml \
    qml/pages/fileView/Image.qml \
    qml/pages/fileView/Video.qml \
    qml/pages/fileView/Text.qml \
    qml/pages/FileOperationPage.qml \
    qml/pages/fileView/Audio.qml \
    qml/pages/FilePage.qml \
    qml/pages/FileRenameDialog.qml \
    qml/pages/NewFilesDialog.qml \
    qml/pages/settings/FileDisplay.qml \
    qml/pages/settings/DirectoryDisplay.qml \
    qml/pages/settings/FileRoot.qml \
    qml/Fileman.qml \
    qml/pages/DirectoryPage.qml \
    qml/pages/BackPage.qml \
    qml/pages/dirView/DirectoryFileOperations.qml \
    qml/pages/fileView/PermissionEdit.qml \
    qml/pages/dirView/ShortcutsView.qml \
    qml/pages/fileView/TextEdit.qml \
    qml/pages/ShareFilesPage.qml \
    qml/pages/SearchPage.qml \
    translations/*.ts

HEADERS += \
    src/thumbnailprovider.h \
    src/settings.h \
    src/filelist.h \
    src/iconprovider.h \
    src/fileengine.h \
    src/fileinfoentry.h \
    src/fileinfo.h \
    src/fileprocess.h \
    src/worker.h \
    src/clipboard.h \
    src/covermodel.h \
    src/util.h \
    src/searchengine.h \
    src/statfileinfo.h \
    src/globals.h \
    src/searchworker.h \
    src/directoryworker.h

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172 256x256

CONFIG += sailfishapp_i18n

TRANSLATIONS += \
    translations/harbour-fileman-de.ts \
    translations/harbour-fileman-es.ts \
    translations/harbour-fileman-it.ts \
    translations/harbour-fileman-nl.ts \
    translations/harbour-fileman-fr.ts \
    translations/harbour-fileman-sv.ts \
    translations/harbour-fileman-pl.ts \
    translations/harbour-fileman-zh_CN.ts \
    translations/harbour-fileman-pt_BR.ts \
    translations/harbour-fileman-fi.ts

RESOURCES += \
    resources.qrc
