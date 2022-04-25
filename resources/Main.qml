/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: base
    width: _windowWidth
    height: _windowHeight
    visible: true
    visibility: _showFullscreen ? ApplicationWindow.FullScreen : ApplicationWindow.Windowed
    property int musicIndex: 0
    property bool musicIsPlaying: false
    property bool canCloseDemoFromUI: typeof _canCloseDemoFromUI == 'boolean' ? _canCloseDemoFromUI : true


    FontLoader {
        id: openThin
        source: "/fonts/resources/fonts/OpenSans-Light.ttf"
    }
    FontLoader {
        id: lato
        source: "/fonts/resources/fonts/Lato-Regular.ttf"
    }
    FontLoader {
        id: latoLight
        source: "/fonts/resources/fonts/Lato-Light.ttf"
    }

    Item {
        anchors.fill: parent

        Item {
            anchors.centerIn: parent
            width: _portrait ? parent.height : parent.width
            height: _portrait ? parent.width : parent.height
            rotation: _portrait ? 90 : 0

            Background {
                anchors.fill: parent
                rotateCompass: menuArea.expanded
            }

            AppPage {
                id: pagesArea
                width:  parent.width*1.4
                height: parent.height
                widthOffset: width - parent.width + 80
                x: menuArea.expanded ? parent.width : 80
                title: menuArea.currentItemText

                SwipeView {
                    anchors.fill: parent
                    anchors.rightMargin: pagesArea.widthOffset
                    interactive: false
                    currentIndex: menuArea.currentIndex
                    clip: true

                    Loader {
                        clip: true
                        visible: SwipeView.isCurrentItem
                        sourceComponent: _isLowRes ? smallBoatStatus : normalBoatStatus
                        Component {
                            id: normalBoatStatus
                            BoatStatusContents { }
                        }
                        Component {
                            id: smallBoatStatus
                            BoatStatusContentsSmall { }
                        }
                    }

                    Loader {
                        clip: true
                        visible: SwipeView.isCurrentItem
                        sourceComponent: _isLowRes ? smallBoatSailing : normalBoatSailing
                        Component {
                            id: normalBoatSailing
                            BoatSailingContents { }
                        }
                        Component {
                            id: smallBoatSailing
                            BoatSailingContentsSmall { }
                        }
                    }

                    PageNavigation {
                        visible: SwipeView.isCurrentItem
                        clip: true
                    }
                    Radio {
                        visible: SwipeView.isCurrentItem
                        clip: true
                    }
                    PlayItem {
                        visible: SwipeView.isCurrentItem
                        clip: true
                    }

                    AboutItem {
                        id: aboutItem
                        visible: SwipeView.isCurrentItem
                    }
                }
            }

            AppMenu {
                id: menuArea
                height: parent.height

                model: ListModel {
                    ListElement {
                        name: qsTr("Boat Status")
                        iconText: "icon1"
                    }
                    ListElement {
                        name: qsTr("Sailing")
                        iconText: "icon2"
                    }
                    ListElement {
                        name: qsTr("Navigation")
                        iconText: "icon5"
                    }
                    ListElement {
                        name: qsTr("Com. Radio")
                        iconText: "icon3"
                    }
                    ListElement {
                        name: qsTr("Music Player")
                        iconText: "icon4"
                    }
                    ListElement {
                        name: qsTr("About KDAB")
                        iconText: "icon6"
                    }
                }
            }

            MouseArea {
                onClicked: Qt.quit()
                enabled: canCloseDemoFromUI
                anchors.right: parent.right
                anchors.top: parent.top
                width: 50
                height: 50
            }

        }
    }
}

