/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12
import QtQuick.Layouts 1.12

GridLayout {
    id: boatSailingContents
    columnSpacing: 34
    columns: 3

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
