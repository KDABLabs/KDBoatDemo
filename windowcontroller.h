/*
 * This file is part of the KDAB Nautical UI demo.
 *
 * SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
 *
 * SPDX-License-Identifier: MIT
 *
 * Contact info@kdab.com for more information about this software.
 */

#pragma once

#include <QObject>

class WindowController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int width READ width CONSTANT)
    Q_PROPERTY(int height READ height CONSTANT)

public:
    static WindowController &instance();

    int width() const;
    int height() const;

    void setPortrait(bool portrait);
    void setLowRes(bool lowRes);

private:
    WindowController();

    bool m_portrait;
    bool m_lowRes;
};
