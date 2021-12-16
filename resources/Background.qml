/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.0

Item {
    property bool rotateCompass
    BorderImage {
        width: Math.max(parent.width, sourceSize.width)
        height: Math.max(parent.height, sourceSize.height)
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        source: "/img/resources/images/desenho-2.png"
        border.right: sourceSize.width - 25 - border.left
        border.bottom: sourceSize.height - 25
        border.top: 1
        border.left: 450
    }

    Image {
        id: compassImage
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: -133
        anchors.rightMargin: -260
        source: "/img/resources/images/compass.png"
        scale: 0.5
        opacity: rotateCompass ? 1 : 0.8

        Behavior on opacity {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
        }

        SequentialAnimation {
            running: rotateCompass
            loops: Animation.Infinite
            NumberAnimation { target: compassImage; property: "rotation"; duration: 10000*(Math.random()+1); easing.type: Easing.InOutQuad; to:300*Math.random() }
            NumberAnimation { target: compassImage; property: "rotation"; duration: 10000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-200*Math.random()}
            NumberAnimation { target: compassImage; property: "rotation"; duration: 20000*(Math.random()+1); easing.type: Easing.InOutQuad; to:300*Math.random() }
            NumberAnimation { target: compassImage; property: "rotation"; duration: 20000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-100*Math.random()}
            NumberAnimation { target: compassImage; property: "rotation"; duration: 30000*(Math.random()+1); easing.type: Easing.InOutQuad; to:300*Math.random() }
            NumberAnimation { target: compassImage; property: "rotation"; duration: 30000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-300*Math.random()}
            NumberAnimation { target: compassImage; property: "rotation"; duration: 20000*(Math.random()+1); easing.type: Easing.InOutQuad; to:300*Math.random() }
            NumberAnimation { target: compassImage; property: "rotation"; duration: 20000*(Math.random()+1); easing.type: Easing.InOutQuad; to:-300*Math.random()}
        }
    }
}
