################################################################
# Qwt Widget Library
# Copyright (C) 1997   Josef Wilgen
# Copyright (C) 2002   Uwe Rathmann
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the Qwt License, Version 1.0
###################################################################

INCLUDEPATH += /usr/include/qwt

QWT_ROOT = $${PWD}/..
include( qwtconfig.pri )
include( qwtbuild.pri )
include( qwtfunctions.pri )

QWT_OUT_ROOT = $${OUT_PWD}/../..

TEMPLATE     = app

DEPENDPATH  += $${QWT_ROOT}/src

!debug_and_release {

    DESTDIR      = $${QWT_OUT_ROOT}/examples/bin
}
else {
    CONFIG(debug, debug|release) {

        DESTDIR      = $${QWT_OUT_ROOT}/examples/bin_debug
    }
    else {

        DESTDIR      = $${QWT_OUT_ROOT}/examples/bin
    }
}

greaterThan(QT_MAJOR_VERSION, 4) {
    qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt-qt5)
} else {
    qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
}

greaterThan(QT_MAJOR_VERSION, 4) {

    QT += printsupport
    QT += concurrent
}

contains(QWT_CONFIG, QwtOpenGL ) {

    QT += opengl
}
else {

    DEFINES += QWT_NO_OPENGL
}

contains(QWT_CONFIG, QwtSvg) {

    QT += svg
}
else {

    DEFINES += QWT_NO_SVG
}


win32 {
    contains(QWT_CONFIG, QwtDll) {
        DEFINES    += QT_DLL QWT_DLL
    }
}
