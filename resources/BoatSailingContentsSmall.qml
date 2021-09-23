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
    id: boatSailingContents

    contentWidth: layout.implicitWidth
    contentHeight: layout.implicitHeight

    ScrollBar.vertical: ScrollBar {}

    GridLayout {
        id: layout
        columns: 2

        Clino {
            id: cli
        }
        Wind {
            id: cli2
            gaugetext: qsTr("Wind Direction")
        }
        Compass {
            id: cli3
            gaugetext: qsTr("Compass")
        }
        Speeds{
            gaugetext: qsTr("Boat Speed")
        }
        Speeds{
            gaugetext: qsTr("Wind Speed")
            initvalue: 378
        }
        Textgauge{

        }
    }

}
