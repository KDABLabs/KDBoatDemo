/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: playItem

    GridLayout {
        anchors.fill: parent
        anchors.margins: 15
        rowSpacing: 30
        columnSpacing: rowSpacing-10

        columns: 2

        BorderImage {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.preferredWidth: 400
            Layout.leftMargin: -15
            Layout.rightMargin: -15
            Layout.bottomMargin: -15
            Layout.topMargin: -15
            Layout.rowSpan: 4
            id: playListBaseImage
            source: "/img/resources/images/b.png"
            border { left: 30; top: 100; right: 30; bottom: 50 }
            ListView {
                anchors.fill: parent
                anchors.topMargin: 18
                anchors.bottomMargin: 30
                anchors.leftMargin: 21
                anchors.rightMargin: 21
                id: playList
                clip: true
                snapMode: ListView.SnapToItem
                highlightFollowsCurrentItem : true
                delegate: playDelegate
                model: PlayData {
                    id: playdata
                }

                Component {
                    id: playDelegate
                    Image {
                        source: model.index % 2 == 0 ? "" : "/img/resources/images/staple.png"
                        x: 0
                        width: ListView.view.width
                        height: 64

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                playList.currentIndex = model.index
                                selectingmode.restart()
                                selectingmode.running = true
                                musicIsPlaying = true
                                musicIndex = playList.currentIndex
                            }
                        }

                        Image {
                            id: image1
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.horizontalCenterOffset: -140
                            width: playList.currentIndex == index ? 64 : 54
                            height: width
                            source: "/albumcovers/resources/albumcover/"+coverd
                            smooth: true
                            Behavior on width {
                                NumberAnimation {  duration: 300; easing.type: Easing.InOutQuad }
                            }
                        }

                        Text {
                            id: text1
                            x: 83
                            y: 8
                            color: "#fff"
                            text: titled
                            font.family: openThin.name
                            font.pixelSize: 19
                            smooth: true
                            opacity: 0.8
                        }

                        Text {
                            id: text2
                            x: 298
                            y: 14
                            color: "#fff"
                            text: durationd
                            font.pixelSize: 14
                            font.family: openThin.name
                            smooth: true
                            opacity: 0.8
                        }
                    }
                }
            }
        }

        Text {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: 30
            id: textNow
            color: "#fff"
            text: "" + (musicIsPlaying ? "Now playing " : "Music Paused ")
            font.family: openThin.name
            font.pixelSize: 26
        }

        Text {
            id: textNowMusic
            color: "#fff"
            text: (selectingmode.running || refadeCover.running) ? playdata.get(playList.currentIndex).titled : playdata.get(musicIndex).titled
            font.family: openThin.name
            font.pixelSize: 32
            opacity: cover.opacity
        }

        Text {
            id: textNowAlbum
            color: "#fff"
            text: (selectingmode.running || refadeCover.running) ? playdata.get(playList.currentIndex).album : playdata.get(musicIndex).album
            font.family: openThin.name
            font.pixelSize: 28
            opacity: cover.opacity
        }

        Row {
            spacing: parent.rowSpacing
            Layout.bottomMargin: 5
            Image {
                id: cover
                width: Math.max( Math.min( playItem.height - 255 , sourceSize.height), 140 )
                height: width
                source: "/albumcovers/resources/albumcover/" + ((selectingmode.running || refadeCover.running) ? playdata.get(playList.currentIndex).coverd : playdata.get(musicIndex).coverd)

                Behavior on opacity {
                    NumberAnimation { duration: 800; easing.type: Easing.InOutQuad }
                }
            }

            Image {
                id: pausePlay
                property bool pause: true
                anchors.verticalCenter: cover.verticalCenter
                source: (playList.currentIndex == musicIndex && musicIsPlaying) ? "/img/resources/images/pause.png" : "/img/resources/images/play.png"

                Behavior on scale{
                    NumberAnimation { duration: 100; easing.type: Easing.InOutQuad }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (playList.currentIndex==musicIndex) {
                            musicIsPlaying = !musicIsPlaying
                        } else {
                            musicIndex = playList.currentIndex
                        }
                        pausePlay.scale = 1
                    }
                    onPressed: pausePlay.scale = 0.95
                    onReleased: pausePlay.scale = 1
                }
            }
        }
        Timer {
            id: selectingmode
            interval: 3500
            onTriggered: {
                cover.opacity = 0
                refadeCover.restart()
            }
        }

        Timer {
            id: refadeCover
            interval: 800
            onTriggered: {
                cover.opacity = 1
                playList.currentIndex = musicIndex
            }
        }
    }
}
