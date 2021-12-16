/*
  This file is part of the KDAB Nautical UI demo.

  SPDX-FileCopyrightText: 2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>

  SPDX-License-Identifier: MIT

  Contact info@kdab.com for more information about this software.
*/

import QtQuick 2.12

Item {
    id: root
    width: expanded ? 300 : 70

    property alias model: menu.model
    property bool expanded: true
    property alias currentIndex: menu.currentIndex
    readonly property string currentItemText: menu.currentItem ? menu.currentItem.itemText : ""

    Behavior on width {
        NumberAnimation { duration: 1100; easing.type: Easing.InOutBack }
    }

    Rectangle {
        id: shade
        anchors.fill: parent
        color: "black"
        opacity: 0.6
        Rectangle {
            color:"white"
            width: 1
            height: parent.height
            anchors.right: parent.right
            opacity: 0.7
        }
        Rectangle {
            color: "black"
            width: 1
            height: parent.height
            anchors.right: parent.right
            anchors.rightMargin: -1
            opacity: 0.7
        }
        Rectangle {
            color:"black"
            width: 1
            height: parent.height
            anchors.right: parent.right
            anchors.rightMargin: -2
            opacity: 0.2
        }
    }

    ListView {
        //clip: true
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        interactive: root.expanded

        id: menu

        TapHandler {
            enabled: !root.expanded
            onTapped: expanded = true
        }

        delegate: Item {
            readonly property string itemText: model.name
            width: 300
            height: 720/6 // fit all 6 elements of the model on a 720 screen
            anchors.right: parent.right
            Text {
                id:menuText
                color: "#fff"
                text: model.name
                font.family: openThin.name
                font.pixelSize: 31
                anchors.right: parent.right
                anchors.rightMargin: 75
                font.weight: Font.Light
                anchors.verticalCenter: icon.verticalCenter
            }
            Image {
                id: icon
                source: "/img/icons/resources/images/icons/"+model.iconText+".png"
                anchors.right: parent.right
                anchors.rightMargin: Math.floor(-width/2+34)
                anchors.verticalCenter: parent.verticalCenter
                opacity: root.width<170 ? (menu.currentIndex === index ? 1 : 0.1) : 0.7
                scale: root.width<170 ? (menu.currentIndex === index ? 1 : 0.7) : 1
                Behavior on opacity  {
                    OpacityAnimator {
                        duration: 1100
                        easing.type: Easing.InOutBack
                    }
                }
                Behavior on scale {
                    NumberAnimation { duration: 1100; easing.type: Easing.InOutBack }
                }
            }
            Image {
                id: iconCopy
                source: "/img/icons/resources/images/icons/"+model.iconText+"s.png"
                opacity: 0
                scale: 0.1
                property int movX: 0
                x: -sourceSize.width/2+icon.x+icon.width/2+movX
                y: -sourceSize.height/2+icon.y+icon.height/2
                SequentialAnimation {
                    id: glow
                    NumberAnimation { target: iconCopy; property: "opacity"; duration: 200; easing.type: Easing.InOutQuad; from: 0; to: 1 }
                    ParallelAnimation{
                        NumberAnimation { target: iconCopy; property: "opacity"; duration: 1200; easing.type: Easing.InCubic; from: 1; to: 0 }
                        NumberAnimation { target: iconCopy; property: "scale"; duration:1200; easing.type: Easing.InCubic; from: 0.1; to: 1 }
                        NumberAnimation { target: iconCopy; property: "movX"; duration:1200; easing.type: Easing.InCubic; from:0; to: 150 }
                    }
                    NumberAnimation { target: iconCopy; property: "scale"; duration: 0; easing.type: Easing.InOutQuad;to: 0.1 }
                    NumberAnimation { target: iconCopy; property: "movX"; duration: 0; easing.type: Easing.InOutQuad; to: 0 }
                }
            }
            TapHandler {
                enabled: root.expanded
                onTapped: {
                    menu.currentIndex = index
                    root.expanded = false
                    glow.start()
                }
            }
        }
    }
}
