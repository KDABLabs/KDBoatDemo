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

import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: radio

    ColumnLayout {
        anchors.centerIn: parent

        Item {
            id: bigNumbers
            width: display.width
            height: 200

            GridLayout {
                id: display
                anchors.verticalCenter: parent.verticalCenter
                columns: 4

                Text {
                    Layout.columnSpan: parent.columns
                    Layout.leftMargin: -15
                    color: "#fff"
                    text: "Channel"
                    font.family: lato.name
                    font.pixelSize: 20
                }

                Text {
                    Layout.rowSpan: 2
                    id: channelText
                    color: "#19d9d9d9"
                    text: "0"
                    font.pixelSize: 173
                    Text {
                        x: text == "1" ? 39 : 0
                        property string temp2: (flickableNumber.currentIndex < 10 ? "0" : "") + flickableNumber.currentIndex
                        color: "#d9d9d9"
                        text: temp2.substring(0, 1)
                        font.pixelSize: 173
                    }
                }
                Text {
                    Layout.rowSpan: 2
                    color: "#19d9d9d9"
                    text: "0"

                    font.pixelSize: 173
                    Text {
                        property string temp: flickableNumber.currentIndex<10? "0"+(flickableNumber.currentIndex): (flickableNumber.currentIndex)
                        x: text == "1" ? 39 : 0
                        id: chanelText2
                        color: "#d9d9d9"
                        text: temp.substring(1, 2)

                        font.pixelSize: 173
                    }
                }

                Text {
                    Layout.alignment: Qt.AlignBottom | Qt.AlignRight
                    Layout.leftMargin: 30
                    color: "#fff"
                    text: "A"
                    font.pixelSize: 33
                    opacity: 0.4+push.opacity/2
                }
                Text {
                    Layout.alignment: Qt.AlignBottom | Qt.AlignRight
                    Layout.minimumWidth: ledMetrics.width
                    color: "#fff"
                    horizontalAlignment: Text.AlignRight
                    text: Number(156.0000001 + flickableNumber.currentIndex * 0.05).toFixed(2) + "  mhz"
                    font.pixelSize: 33
                    opacity: 0.4+push.opacity/2
                }

                Text {
                    Layout.alignment: Qt.AlignTop | Qt.AlignRight
                    Layout.leftMargin: 30
                    color: "#fff"
                    text: "B"
                    font.pixelSize: 33
                    opacity: 0.4+push2.opacity/2
                }
                Text {
                    Layout.alignment: Qt.AlignTop | Qt.AlignRight
                    Layout.minimumWidth: ledMetrics.width
                    color: "#fff"
                    id: bMhzText
                    horizontalAlignment: Text.AlignRight
                    text: Number(160.0000001 + flickableNumber.currentIndex * 0.05).toFixed(2) + "  mhz"
                    font.pixelSize: 33
                    opacity: 0.4 + push2.opacity / 2
                    TextMetrics {
                        id: ledMetrics
                        font: bMhzText.font
                        text: "888.88  mhz"
                    }
                }
            }
            ListView {
                id: flickableNumber
                opacity: 0
                width: 180; height: channelText.height
                model: 61
                delegate: Text {
                    width: ListView.view.width
                    text: index+1
                    font.pixelSize: 67
                }
                highlightFollowsCurrentItem: true
                highlightRangeMode: ListView.StrictlyEnforceRange
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            color: "#fff"
            text: qsTr("International distress, safety and calling")
            font.family: openThin.name
            font.pixelSize: 19
            font.weight: Font.Light
            opacity: flickableNumber.currentIndex === 16 ? 1 : 0
        }

        Item {
            Layout.fillWidth: true
            Layout.maximumWidth: display.width
            height: push.height

            id: pushToTalk
            Image {
                id: push
                source: "/img/resources/images/b.png"
                width: parent.width
                opacity: pushToTalkMouse.pressed ? 0 : 1
                MouseArea {
                    id: pushToTalkMouse
                    anchors.fill: parent
                }
                Behavior on opacity {
                    NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
                }
            }
            Image {
                id: push2
                width: parent.width
                y: pushToTalkMouse.pressed ? 2 : 1
                source: "/img/resources/images/bp.png"
                opacity: 1 - push.opacity
            }

            Text {
                color: "#fff"
                text: qsTr("Push To Talk")
                font.family: lato.name
                font.pixelSize: 33
                anchors.verticalCenterOffset: -2
                anchors.horizontalCenter: push2.horizontalCenter
                anchors.verticalCenter: push2.verticalCenter
            }
        }
    }
}
