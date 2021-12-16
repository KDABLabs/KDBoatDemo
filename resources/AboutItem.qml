/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: aboutItem
    Flickable { anchors.fill: parent
        contentHeight: flowText.height
        interactive: flowText.height>height

        Flow {
            id: flowText
            width:parent.width-150
            anchors.centerIn: parent
            Text {
                id: name
                wrapMode: Text.WordWrap
                width: parent.width
                font.family: openThin.name
                font.pixelSize: 31
                color: "#fff"
                font.weight: Font.Light
                text: "
KDAB the Qt, C++ and OpenGL Experts
"

            }
            Text {
                id: name2
                wrapMode: Text.WordWrap
                width: parent.width
                font.family: openThin.name
                font.pixelSize: 23
                color: "#fff"
                font.weight: Font.Light
                text: "The KDAB Group is the leading provider for Qt, C++ and 3D/OpenGL software expertise across desktop, embedded and mobile platforms."

            }
            Text {
                id: name3
                wrapMode: Text.WordWrap
                width: parent.width
                font.family: openThin.name
                font.pixelSize: 15
                color: "#fff"
                text: "
The KDAB Group is the leading software consulting, development and training provider for Qt, C++ and 3D/OpenGL. Since 1999, KDAB’s unique software expertise has helped thousands of customers to improve quality, productivity and time to market across desktop, embedded and mobile platforms. Our customers – several from the Fortune 500 list – are active within Automotive, Biotech, Medical, Industrial Embedded, Entertainment, Government, Consumer Software and other innovative sectors. We take great pride in delivering our projects successfully, on time and with high quality.

In 2020 the KDAB Group had 90+ employees across Americas, Europe and Asia. The main offices are in Germany, France, the UK, Houston, TX (USA) and Sweden.

Contact us to find out how we can help you.
"

            }
        }
    }
}
