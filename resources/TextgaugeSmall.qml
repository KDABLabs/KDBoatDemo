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
    property string gaugetext: qsTr("Temperature")
    property string inttext: qsTr("24ºC")
    property int off: 3

    implicitWidth: Math.max(gaugeText.width, row.width)
    implicitHeight: 80

    Text {
        id: gaugeText
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ffffff"
        text: gaugeBase.gaugetext
        font.family: latoLight.name
        font.pixelSize: 16
    }
    Row {
        id: row
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: icon
            y: 25
            source: off == 1 ? "/img/icons/resources/images/icons/on.png" : off == 2 ? "/img/icons/resources/images/icons/off.png" : "/img/icons/resources/images/icons/none.png"
        }

        Text {
            color: "white"
            anchors.verticalCenter: icon.verticalCenter
            text: gaugeBase.inttext
            font.family: openThin.name
            font.pixelSize: 19
            y: 35
            font.weight: Font.Light
        }
    }
}
