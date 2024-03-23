# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="zxtune"
PKG_VERSION="376440899432667c8dc2850cc9dfc13af1cf88d2"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/vitamin-caig/zxtune"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain boost"
PKG_LONGDESC="ZXTune"
PKG_TOOLCHAIN="make"

make_target() {
  make
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/share/zxtune

  #cp -f ${PKG_BUILD}/usr/bin/xtractor ${INSTALL}/usr/bin
  #cp -f ${PKG_BUILD}/usr/bin/zxtune123 ${INSTALL}/usr/bin
  cp -f ${PKG_DIR}/config/* ${INSTALL}/usr/share/zxtune
  
  cp -f ${PKG_DIR}/scripts/start_zxtune.sh ${INSTALL}/usr/bin
  chmod +x ${INSTALL}/usr/bin/start_zxtune.sh

  chmod +x ${INSTALL}/usr/bin/*
}
