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

find_package(Qt6 6.3.0 COMPONENTS Core Quick Core5Compat REQUIRED)

set(QT_WASM_INITIAL_MEMORY "64MB")

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC TRUE)
set(CMAKE_AUTORCC TRUE)

qt_add_executable(KDABBoatDemo
    MANUAL_FINALIZATION
    main.cpp
    imagesMaps.qrc
    imagesMaps2.qrc
    images.qrc
    data.qrc
)

target_compile_definitions(KDABBoatDemo
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(KDABBoatDemo
  PRIVATE
    Qt::Core
    Qt::Gui
    Qt::Quick
    Qt::Core5Compat
)
qt_import_qml_plugins(KDABBoatDemo)
qt_finalize_executable(KDABBoatDemo)
