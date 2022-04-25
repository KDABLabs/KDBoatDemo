/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QGuiApplication>
#include <QCursor>
#include <QCommandLineParser>
#include <QScreen>

/**
 * KDAB Boat demo
 */

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

#if !defined(Q_OS_WASM)
    QCommandLineParser parser;
    parser.setApplicationDescription("KDAB Nautical UI - concept of the next generation UI for sailing boats");
    parser.addHelpOption();
    parser.addVersionOption();

    QCommandLineOption quitOption(QStringList() << "q"
                                                << "quit",
                                  "Show quit button.");
    parser.addOption(quitOption);

    QCommandLineOption cursorDisableOption("no-cursor",
                                           "Make sure no pointer is hidden.");
    parser.addOption(cursorDisableOption);

    QCommandLineOption fullscreenOption("fullscreen",
                                        "Open the demo in fullscreen");
    parser.addOption(fullscreenOption);

    QCommandLineOption landscapeOption("landscape",
                                       "Open the demo in landscape mode (default: autodetect)");
    parser.addOption(landscapeOption);

    QCommandLineOption portraitOption("portrait",
                                      "Open the demo in portrait mode (default: autodetect)");
    parser.addOption(portraitOption);

    QCommandLineOption lowresOption("lowres",
                                    "Open the demo in low resolution");
    parser.addOption(lowresOption);

    parser.process(app);

    if (parser.isSet(cursorDisableOption))
        app.setOverrideCursor(QCursor(Qt::BlankCursor));

    QScreen *primaryScreen = QGuiApplication::primaryScreen();
    if (!primaryScreen)
        qFatal("Cannot determine the primary screen");

    if (parser.isSet(portraitOption) && parser.isSet(landscapeOption))
        qFatal("Cannot set both landscape and portrait at the same time");


    engine.rootContext()->setContextProperty("_canCloseDemoFromUI", QVariant::fromValue(parser.isSet(quitOption)));
    engine.rootContext()->setContextProperty("_showFullscreen", QVariant::fromValue(parser.isSet(fullscreenOption)));

    const bool portrait = [&]() {
        if (parser.isSet(portraitOption)) {
            return true;
        } else if (parser.isSet(landscapeOption)) {
            return false;
        } else {
            QSize primaryGeometry = primaryScreen->size();
            return (primaryGeometry.height() > primaryGeometry.width());
        }
    }();
    engine.rootContext()->setContextProperty("_portrait", QVariant::fromValue(portrait));

    const bool isLowRes = [&]() {
        if (parser.isSet(lowresOption))
            return true;
        QSize primaryGeometry = primaryScreen->size();
        return primaryGeometry.width() < 1280 || primaryGeometry.height() < 720;
    }();
    engine.rootContext()->setContextProperty("_isLowRes", QVariant::fromValue(isLowRes));

    if (isLowRes) {
        engine.rootContext()->setContextProperty("_windowWidth", QVariant::fromValue(portrait ? 480 : 800));
        engine.rootContext()->setContextProperty("_windowHeight", QVariant::fromValue(portrait ? 800 : 480));
    } else {
        engine.rootContext()->setContextProperty("_windowWidth", QVariant::fromValue(portrait ? 720 : 1280));
        engine.rootContext()->setContextProperty("_windowHeight", QVariant::fromValue(portrait ? 1280 : 720));
    }
#else
    engine.rootContext()->setContextProperty("_windowWidth", -1);
    engine.rootContext()->setContextProperty("_windowHeight", -1);
    engine.rootContext()->setContextProperty("_portrait", false);
    engine.rootContext()->setContextProperty("_isLowRes", false);
    engine.rootContext()->setContextProperty("_showFullscreen", true);
#endif

    const QUrl url(QStringLiteral("qrc:/resources/Main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
