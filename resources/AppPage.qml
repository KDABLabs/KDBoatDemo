/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    id: root

    property int widthOffset

    Behavior on x {
        SequentialAnimation {
            PauseAnimation { duration: (root.x === 80 ? 0 : 600) }
            NumberAnimation { easing.overshoot: 1.062;  duration: 1100; easing.type: Easing.OutBack }}
    }

    header: Item {
        width: parent.width
        height: titleText.height + 10

        Text {
            id: titleText
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: widthOffset + 25
            color: "#fff"
            text: root.title
            font.family: openThin.name
            font.pixelSize: 47
            font.weight: Font.Light
        }
    }

    background: Rectangle {
        id: shade2
        color: "black"
        opacity: 0.6
        Rectangle {
            color:"white"
            width: 1
            height: parent.height
            anchors.right: parent.left
            opacity: 0.7
        }
        Rectangle {
            color: "black"
            width: 1
            height: parent.height
            x: -2
            opacity: 0.7
        }
        Rectangle {
            color: "black"
            width: 1
            height: parent.height
            x: -3
            opacity: 0.2
        }
    }
}
