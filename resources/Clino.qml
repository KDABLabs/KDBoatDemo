/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.0
Item {
    id: gaugeBase
    property string gaugetext: qsTr("Boat Inclination")
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
        scale: gaugeBase.focus ? 1 : 0.7
        smooth: true

        Behavior on scale {
            NumberAnimation { duration: 600; easing.type: Easing.InOutQuad }
        }

        MouseArea{
            width: 265*scale
            height: 265*scale
            onClicked: gaugeBase.focus = !gaugeBase.focus
        }

        Image {
            source: "/img/gauges/resources/images/gauges/clibase.png"
            Image {
                id: scaleImage
                source: "/img/gauges/resources/images/gauges/cliscale.png"
                anchors.centerIn: parent
            }
            Image {
                id: centerImage
                source: "/img/gauges/resources/images/gauges/clicenter.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                rotation: scaleImage.rotation
                anchors.verticalCenterOffset: 0
            }
            Text {
                color: "#ffffff"
                text: qsTr("%1°").arg(Math.ceil(scaleImage.rotation))
                font.family: openThin.name
                font.pixelSize: 20
                y: 200
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad; to: -40 * Math.random()+5}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad; to: -20 * Math.random()+5}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: -40 * Math.random()+5}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to:  10 * Math.random()}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to: -40 * Math.random()+5}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to: -20 * Math.random()+5}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: -40 * Math.random()+5}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to: -40 * Math.random()+5}
        }
        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-10*Math.random()}
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 1000*(Math.random()+1); easing.type: Easing.InOutQuad; to:10 *Math.random()}
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-10*Math.random()}
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to:10 *Math.random()}
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-10*Math.random()}
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 3000*(Math.random()+1); easing.type: Easing.InOutQuad; to:10 *Math.random()}
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-10*Math.random()}
            NumberAnimation { target: centerImage; property: "anchors.verticalCenterOffset"; duration: 2000*(Math.random()+1); easing.type: Easing.InOutQuad; to:10 *Math.random()}
        }
}
}
