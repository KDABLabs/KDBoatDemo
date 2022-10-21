# This file is part of the KDAB Nautical UI demo.
#
# SPDX-FileCopyrightText: 2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
#
# SPDX-License-Identifier: MIT
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

install(TARGETS KDABBoatDemo RUNTIME DESTINATION bin)
