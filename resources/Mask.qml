/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.0
import Qt5Compat.GraphicalEffects // for OpacityMask

Item {
    id: mask
    clip: true
    Image {
        source: "/img/maps/resources/images/maps/radarbase1.png"
        height: parent.height
        fillMode: Image.PreserveAspectFit
        anchors.centerIn: parent
    }

    Image {
        id: name2
        visible: false
        source: "/img/maps/resources/images/maps/radarbase.png"
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }
    ConicalGradient {
        id: name3
        visible: false
        anchors.fill: parent
        angle: 0.0
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(1, 1, 1, 0.2) }
            GradientStop { position: 0.007; color: Qt.rgba(1, 1, 1, 1) }
            GradientStop { position: 0.05; color: Qt.rgba(1, 1, 1, 0.3) }
            GradientStop { position: 0.3; color: Qt.rgba(1, 1, 1, 0.1) }
            GradientStop { position: 0.5; color: Qt.rgba(1, 1, 1, 0.02) }
            GradientStop { position: 1.0; color: Qt.rgba(1,1, 1,0.02) }
        }
        NumberAnimation { target: name3; property: "angle"; duration: 6200; from:0; to:-360; loops: -1; running: true }
    }

    OpacityMask {
        anchors.fill: parent
        source: name2
        maskSource: name3
    }
    ConicalGradient {
        anchors.fill: parent
        angle: name3.angle
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.6, 0.8, 1, 0.0) }
            GradientStop { position: 0.007; color: Qt.rgba(0.6, 0.8, 1, 0.4) }
            GradientStop { position: 0.02; color: Qt.rgba(0.6, 0.8, 1, 0.0) }
            GradientStop { position: 0.3; color: Qt.rgba(1, 1, 1, 0.0) }
            GradientStop { position: 0.5; color: Qt.rgba(1, 1, 1, 0.0) }
            GradientStop { position: 1.0; color: Qt.rgba(1,1, 1,0.0) }
        }
    }
}
