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

import QtQuick 2.0

Item {
    id: gaugeBase
    property string gaugetext: "" // set externally
    width: 225*gauge.scale + 140
    height: width

    Text {
        id: gaugeText
        color: "#ffffff"
        text: gaugetext
        font.family: lato.name
        font.pixelSize: 20
        width: 140
        font.weight: Font.Light
    }

    Item {
        id: gauge

        anchors.left: gaugeText.right
        anchors.leftMargin: -40*gauge.scale
        scale: gaugeBase.focus?1:0.7
        smooth: true

        Behavior on scale {
            NumberAnimation { duration: 600; easing.type: Easing.InOutQuad }
        }

        MouseArea {
            width: 265*scale
            height: 265*scale
            onClicked: gaugeBase.focus=!gaugeBase.focus
        }

        Image {
            source: "/img/gauges/resources/images/gauges/compassbase.png"
            Image {
                id: scaleImage
                source: "/img/gauges/resources/images/gauges/compass.png"
                anchors.centerIn: parent
            }
            Text {
                color: "#444444"
                text: (Math.ceil(scaleImage.rotation))+"º"
                font.family: openThin.name
                style: Text.Outline
                font.pixelSize: 20
                y: 200
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: 0.3
            }

            Text {
                color: "#ffffff"
                text: (Math.ceil(scaleImage.rotation))+"º"
                font.family: openThin.name
                font.pixelSize: 20
                y: 200
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        SequentialAnimation {
            running: true
            loops: -1
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad; from: 195; to: 40*Math.random()+195}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 10 *Math.random()+195}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 10*Math.random()+195}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 10 *Math.random()+195}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 10*Math.random()+197}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 20 *Math.random()+195}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 10*Math.random()+195}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: 195}
        }

    }
}
