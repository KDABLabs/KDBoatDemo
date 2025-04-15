/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.0

Item {
    id: gaugeBase
    property string gaugetext: "" // set externally
    property int saclefactor: 8
    property int initvalue: 355
    property real variance: 300
    property string unit: "knots"
    property int precision: 3
    property int speed: 100

    width: 225 * gauge.scale + 140
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

        MouseArea {
            x: 13
            y: 0
            width: 265*scale
            height: 365*scale
            onClicked: gaugeBase.focus = !gaugeBase.focus
        }

        Image {
            source: "/img/gauges/resources/images/gauges/speed.png"
            smooth: true
            Image {
                id: scaleImage
                anchors.verticalCenterOffset: 21
                anchors.horizontalCenterOffset: 71
                source: "/img/gauges/resources/images/gauges/speedneddle.png"
                anchors.centerIn: parent
                smooth: true
                antialiasing: true
            }

            Text {
                color: "#ffffff"

                function calculate(rotation, scaleFactor) {
                    return ((rotation-310)/scaleFactor).toFixed(1) // one decimal
                }

                text: calculate(scaleImage.rotation, saclefactor) + unit
                font.family: openThin.name
                font.pixelSize: 20
                y: 85
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 20
                smooth: true
            }
        }

        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 10*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; from: initvalue+(0.05*variance); to: 0.1*Math.random()*variance +initvalue}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 10*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; to: 0.1*Math.random()*variance+initvalue}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 20*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; to: 0.1*Math.random()*variance+initvalue}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 20*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; to: 0.1*Math.random()*variance+initvalue}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 30*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; to: 0.1*Math.random()*variance+initvalue }
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 30*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; to: 0.1*Math.random()*variance+initvalue}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 20*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; to: 0.1*Math.random()*variance+initvalue}
            NumberAnimation { target: scaleImage; property: "rotation"; duration: 20*(Math.random()+1)*speed; easing.type: Easing.InOutQuad; to: initvalue+(0.05*variance)}
        }
    }
}
