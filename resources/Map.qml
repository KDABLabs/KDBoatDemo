/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.0

Flickable {
    id: map
    property int numberi: 18
    anchors.fill: parent
    contentWidth: image.width
    contentHeight: image.height
    boundsBehavior: Flickable.StopAtBounds
    maximumFlickVelocity: 300
    flickDeceleration: 350
    Image {
        id: image
        source: "/img/maps/resources/images/maps/shot" + map.numberi + (Qt.platform.os === "wasm" ? ".png" : "")
        anchors.centerIn: parent
    }
}
