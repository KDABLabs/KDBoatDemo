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

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Flickable {
    id: boatStatusContents
    contentWidth: layout.implicitWidth
    contentHeight: layout.implicitHeight

    ScrollBar.vertical: ScrollBar {}

    GridLayout {
        id: layout
        columns: 3

        Speeds {
            gaugetext: qsTr("Oil Pressure")
            initvalue: 380
            variance: 20
            unit: " psi"
            precision: 4
            speed: 400
        }

        Textgauge {
            inttext: qsTr("Off")
            gaugetext: qsTr("Diesel engine")
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignTop | Qt.AlignLeft
            Layout.rowSpan: 3
            spacing: 37
            TextgaugeSmall {
                Layout.alignment: Qt.AlignHCenter
                gaugetext: qsTr("Internal Lights")
                inttext: qsTr("On")
                off: 1
            }
            TextgaugeSmall {
                Layout.alignment: Qt.AlignHCenter
                gaugetext: qsTr("Exterior Lights")
                inttext: qsTr("Off")
                off: 2
            }
            TextgaugeSmall {
                Layout.alignment: Qt.AlignHCenter
                gaugetext: qsTr("Solar Charger")
                inttext: qsTr("On")
                off: 1
            }
            TextgaugeSmall {
                Layout.alignment: Qt.AlignHCenter
                gaugetext: qsTr("Anchor Position")
                inttext: qsTr("Stored")
            }
            TextgaugeSmall {
                Layout.alignment: Qt.AlignHCenter
                gaugetext: qsTr("Main Sail")
                inttext: qsTr("Open")
            }
            TextgaugeSmall {
                Layout.alignment: Qt.AlignHCenter
                gaugetext: qsTr("Front Sail")
                inttext: qsTr("Open")
            }
        }

        Textgauge {
            inttext: qsTr("On")
            gaugetext: qsTr("Water Pump")
        }

        Speeds {
            gaugetext: qsTr("Diesel Tank")
            initvalue: 320
            variance: 0
            unit: " x10 Gal."
            precision: 4
            speed: 1000000
        }

        Speeds {
            gaugetext: qsTr("Battery")
            initvalue: 409
            variance: 12
            unit: " Volts"
            precision: 4
            speed: 1000000
        }

        Speeds {
            gaugetext: qsTr("Water level")
            initvalue: 350
            variance: 120
            unit: ""
            precision: 4
            speed: 100
        }
    }
}
