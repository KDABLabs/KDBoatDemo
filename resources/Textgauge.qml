/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.0

Item {
    id: gaugeBase
    property string gaugetext: qsTr("Temperature")
    property string inttext: qsTr("24ºC")

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
        anchors.top: gaugeBase.top
        anchors.bottom: gaugeBase.bottom
        anchors.right: gaugeBase.right

        scale: gaugeBase.focus ? 1 : 0.7
        smooth: true

        Behavior on scale {
            NumberAnimation { duration: 600; easing.type: Easing.InOutQuad }
        }

        MouseArea {
            anchors.fill: gauge
            onClicked: gaugeBase.focus=!gaugeBase.focus
        }

        Text {
            color: "#ffffff"
            text: inttext
            y: 75
            font.family: openThin.name
            font.pixelSize: 73
            font.weight: Font.Light
        }
    }


}
