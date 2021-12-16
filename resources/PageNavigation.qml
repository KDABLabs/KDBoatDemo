/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12

Item {
    id: root

    property bool _sonarHighlight: false

    Grid {
        id: container
        anchors.fill: parent
        anchors.margins: 30
        spacing: 30
        columns: 2

        Maparea {
            id: maparea
            width: _sonarHighlight ? container.width * 0.25 - container.spacing : container.width * 0.7
            height: _sonarHighlight ? container.width * 0.25 - container.spacing : container.height - container.spacing
            Icon {
                enabled: _sonarHighlight
                TapHandler {
                    enabled: parent.enabled
                    onTapped: _sonarHighlight = false
                }
            }

            Behavior on height {
                NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }
            }
            Behavior on width {
                NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }
            }
        }

        BorderImage {
            id: sonar
            source: "/img/resources/images/mapborder.png"
            width: _sonarHighlight ? container.width * 0.7 : container.width * 0.25 - container.spacing
            height: _sonarHighlight ? container.height - container.spacing : container.width * 0.25 - container.spacing
            horizontalTileMode: BorderImage.Repeat
            verticalTileMode: BorderImage.Repeat
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5

            Mask {
                anchors.fill: parent
                anchors.margins: 6
            }

            Icon {
                id: icon2
                enabled: !_sonarHighlight
                TapHandler {
                    enabled: parent.enabled
                    onTapped: _sonarHighlight = true
                }
            }

            Behavior on height {
                NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }
            }
            Behavior on width {
                NumberAnimation { duration: 400; easing.type: Easing.InOutQuad }
            }
        }
    }
}
