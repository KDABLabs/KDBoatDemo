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

#include <QAbstractListModel>

struct MusicData {
    Q_GADGET
    Q_PROPERTY(QString coverd MEMBER coverd)
    Q_PROPERTY(QString titled MEMBER titled)
    Q_PROPERTY(QString durationd MEMBER durationd)
    Q_PROPERTY(QString album MEMBER album)

public:
    QString coverd;
    QString titled;
    QString durationd;
    QString album;
};

class MusicModel : public QAbstractListModel {
    Q_OBJECT

public:
    enum Roles {
        Coverd,
        Titled,
        Durationd,
        Album,
    };

    MusicModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE MusicData get(int index) const;

private:
    QList<MusicData> m_data;
};
