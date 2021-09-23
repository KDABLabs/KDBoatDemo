# This file is part of the KDAB Nautical UI demo.
#
# SPDX-FileCopyrightText: 2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
#
# SPDX-License-Identifier: AGPL-3.0-only
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>
#
# Contact info@kdab.com for more information about this software.
#

project(KDABBoatDemo)
cmake_minimum_required(VERSION 3.9)
find_package(Qt5 CONFIG REQUIRED COMPONENTS Core Gui Quick)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC TRUE)
set(CMAKE_AUTORCC TRUE)

add_executable(KDABBoatDemo
  main.cpp
  imagesMaps.qrc
  imagesMaps2.qrc
  images.qrc
  data.qrc
)
target_link_libraries(KDABBoatDemo Qt5::Core Qt5::Gui Qt5::Quick)
