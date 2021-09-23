/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: AGPL-3.0-only

  This program is free software: you can redistribute it and/or modify it
  under the terms of the GNU Affero General Public License as published by
  the Free Software Foundation, version 3.

  This program is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
  License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program. If not, see <https://www.gnu.org/licenses/>

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12

BorderImage {
    id: maparea
    property int zoom: 1

    source: "/img/resources/images/mapborder.png"

    horizontalTileMode: BorderImage.Repeat
    verticalTileMode: BorderImage.Repeat
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    Item {
        anchors.fill: parent
        anchors.margins: 6
        clip:true

        Map {
            id: map4
            numberi: 22
            visible: numberi == maparea.zoom+17
        }
        Map {
            id: map3
            numberi: 21
            visible: numberi == maparea.zoom+17
        }
        Map {
            id: map2
            numberi: 20
            visible: numberi == maparea.zoom+17
        }
        Map {
            id: map1
            numberi: 19
            visible: numberi == maparea.zoom+17
        }
        Map {
            id: map0
            numberi: 18
            visible: numberi == maparea.zoom+17
        }
    }

    Rectangle {
        id: rectShade
        x: 10
        y: 10

        color: "white"
        height: fromtext.height+8
        width: fromtext.width+20
        opacity: 0.5
    }
    Text {
        id: fromtext
        font.family: lato.name
        font.pixelSize: 12

        text: "Map from: NOAA (USA)"
        anchors.centerIn: rectShade
    }

    Image {
        id: zplus
        source: maparea.zoom == 5 ? "/img/icons/resources/images/icons/zplus-disabled.png" : "/img/icons/resources/images/icons/zplus.png"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 20
        opacity: _sonarHighlight ? 0 : 1
        TapHandler {
            onTapped: maparea.zoom = Math.min(5, maparea.zoom+1)
        }
        Behavior on opacity  {
            OpacityAnimator {
                duration: 400
                easing.type: Easing.InOutQuad
            }
        }
    }
    Image {
        id: zminus
        source: maparea.zoom == 1 ? "/img/icons/resources/images/icons/zminus-disabled.png" : "/img/icons/resources/images/icons/zminus.png"
        anchors.bottom: parent.bottom
        anchors.right: zplus.left
        anchors.margins: 20
        opacity: _sonarHighlight ? 0 : 1
        TapHandler {
            onTapped: maparea.zoom = Math.max(1, maparea.zoom-1)
        }
        Behavior on opacity  {
            OpacityAnimator {
                duration: 400
                easing.type: Easing.InOutQuad
            }
        }
    }
}
