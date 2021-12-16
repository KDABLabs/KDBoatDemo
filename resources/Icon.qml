/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12

Image {
    id: icon
    x: -width/2
    y: -width/2
    source: "/img/icons/resources/images/icons/grow.png"
    opacity: enabled ? 0.4 : 0

    property bool enabled

    Behavior on opacity  {
        OpacityAnimator {
            duration: 400
            easing.type: Easing.InOutQuad
        }
    }
}
