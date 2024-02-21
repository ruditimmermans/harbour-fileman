TARGET = harbour-fileman

i18n_files.files = translations
i18n_files.path = /usr/share/$$TARGET

INSTALLS += i18n_files

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
    src/directoryworker.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    rpm/harbour-fileman.yaml \
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
    qml/pages/fileView/FileInfo.qml \
    qml/js/imageView.js \
    qml/pages/components/ClickableLabel.qml \
    qml/pages/components/IconTextButton.qml \
    qml/pages/components/TextLabel.qml \
    qml/pages/components/CollaboratorsLabel.qml \
    qml/pages/fileView/Image.qml \
    qml/pages/fileView/Video.qml \
    qml/pages/fileView/Text.qml \
    qml/pages/FileOperationPage.qml \
    qml/pages/fileView/Audio.qml \
    qml/pages/FilePage.qml \
    qml/pages/FileRenameDialog.qml \
    qml/pages/NewFilesDialog.qml \
    qml/pages/settings/FileDisplay.qml \
    qml/Fileman.qml \
    qml/pages/DirectoryPage.qml \
    qml/pages/BackPage.qml \
    qml/pages/dirView/DirectoryFileOperations.qml \
    qml/pages/fileView/PermissionEdit.qml \
    qml/pages/dirView/ShortcutsView.qml \
    qml/pages/fileView/TextEdit.qml \
    qml/pages/ShareFilesPage.qml \
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
    src/directoryworker.h

CONFIG += sailfishapp_i18n

TRANSLATIONS += \
    translations/harbour-fileman-de.ts \
    translations/harbour-fileman-es.ts \
    translations/harbour-fileman-nl.ts \
    translations/harbour-fileman-fr.ts \
    translations/harbour-fileman-sv.ts \
    translations/harbour-fileman-pl.ts \
    translations/harbour-fileman-zh-CN.ts \
    translations/harbour-fileman-fi.ts

RESOURCES += \
    resources.qrc

