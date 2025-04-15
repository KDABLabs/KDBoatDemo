/*
 * This file is part of the KDAB Nautical UI demo.
 *
 * SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
 *
 * SPDX-License-Identifier: MIT
 *
 * Contact info@kdab.com for more information about this software.
 */

#include "windowcontroller.h"

WindowController::WindowController()
{

}

WindowController &WindowController::instance()
{
    static WindowController instance;
    return instance;
}

int WindowController::width() const
{
    if (m_lowRes) {
        return m_portrait ? 480 : 800;
    } else {
        return m_portrait ? 720 : 1280;
    }
}

int WindowController::height() const
{
    if (m_lowRes) {
        return m_portrait ? 800 : 480;
    } else {
        return m_portrait ? 1280 : 720;
    }
}

void WindowController::setPortrait(bool portrait)
{

}

void WindowController::setLowRes(bool lowRes)
{

}
