/*
 * This file is part of the KDAB Nautical UI demo.
 *
 * SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
 *
 * SPDX-License-Identifier: MIT
 *
 * Contact info@kdab.com for more information about this software.
 */

#include "musicmodel.h"

MusicModel::MusicModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_data = {
        {
            .coverd = "1200.png",
            .titled = "AlbumZero",
            .durationd = "03:08",
            .album = "AlbumZero",
        },
        {
            .coverd = "1201.png",
            .titled = "What's Inside - Single",
            .durationd = "03:16",
            .album = "A Door Apart",
        },
        {
            .coverd = "1202.png",
            .titled = "Horizon - SundLy",
            .durationd = "06:00",
            .album = "The Last Ultimatum",
        },
        {
            .coverd = "1203.png",
            .titled = "Coming Out To Play",
            .durationd = "02:27",
            .album = "Another Leonard",
        },
        {
            .coverd = "1204.png",
            .titled = "Ride My Tempo",
            .durationd = "04:34",
            .album = "Further Down The Street",
        },
        {
            .coverd = "1205.png",
            .titled = "Inigo (extended version)",
            .durationd = "03:29",
            .album = "Welcome to Waverland",
        },
        {
            .coverd = "1206.png",
            .titled = "Susan Day Scandal Matt",
            .durationd = "05:12",
            .album = "Susan Day",
        },
        {
            .coverd = "1207.png",
            .titled = "In Love",
            .durationd = "02:47",
            .album = "Desert of Silence",
        },
        {
            .coverd = "1208.png",
            .titled = "desert of us",
            .durationd = "04:45",
            .album = "desert",
        },
        {
            .coverd = "1209.png",
            .titled = "Hold Me Close",
            .durationd = "02:55",
            .album = "Osmosis",
        },
        {
            .coverd = "1209.png",
            .titled = "Heart of Everyone",
            .durationd = "02:21",
            .album = "Osmosis",
        },
        {
            .coverd = "1200.png",
            .titled = "AlbumZero",
            .durationd = "03:08",
            .album = "AlbumZero",
        },
        {
            .coverd = "1201.png",
            .titled = "What's Inside - Single",
            .durationd = "03:16",
            .album = "A Door Apart",
        },
        {
            .coverd = "1202.png",
            .titled = "Horizon - SundLy",
            .durationd = "06:00",
            .album = "The Last Ultimatum",
        },
        {
            .coverd = "1203.png",
            .titled = "Coming Out To Play",
            .durationd = "02:27",
            .album = "Another Leonard",
        },
        {
            .coverd = "1204.png",
            .titled = "Ride My Tempo",
            .durationd = "04:34",
            .album = "Last Days Of Disco",
        },
        {
            .coverd = "1205.png",
            .titled = "Inigo (extended version)",
            .durationd = "03:29",
            .album = "Welcome to Waverland",
        },
        {
            .coverd = "1206.png",
            .titled = "Susan Day Scandal Matt",
            .durationd = "05:12",
            .album = "Susan Day",
        },
        {
            .coverd = "1207.png",
            .titled = "In Love",
            .durationd = "02:47",
            .album = "Desert of Silence",
        },
        {
            .coverd = "1208.png",
            .titled = "in the tempo 33",
            .durationd = "04:45",
            .album = "desert",
        },
        {
            .coverd = "1209.png",
            .titled = "Hold Me Close",
            .durationd = "02:55",
            .album = "Osmosis",
        },
        {
            .coverd = "1209.png",
            .titled = "Heart of Everyone",
            .durationd = "02:21",
            .album = "Osmosis",
        },
    };
}

int MusicModel::rowCount(const QModelIndex &parent) const
{
    return m_data.count();
}

QVariant MusicModel::data(const QModelIndex &index, int role) const
{
    switch (static_cast<Roles>(role)) {
    case Album:
        return m_data[index.row()].album;
    case Coverd:
        return m_data[index.row()].coverd;
    case Durationd:
        return m_data[index.row()].durationd;
    case Titled:
        return m_data[index.row()].titled;
    }

    return QVariant();
}

QHash<int, QByteArray> MusicModel::roleNames() const
{
    return {
        {Album, "album"},
        {Coverd, "coverd"},
        {Durationd, "durationd"},
        {Titled, "titled"},
    };
}

MusicData MusicModel::get(int index) const
{
    return m_data[index];
}
