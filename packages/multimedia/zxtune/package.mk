# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="zxtune"
PKG_VERSION="r5056"
PKG_LICENSE="GPLv2"
PKG_SITE="https://bitbucket.org/zxtune/zxtune/downloads"
PKG_URL="${PKG_SITE}/zxtune_${PKG_VERSION}_linux_arm64.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ZXTune"
PKG_TOOLCHAIN="manual"

unpack() {
  mkdir -p ${PKG_BUILD}
  tar --strip-components=1 -xvzf ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.tar.gz -C ${PKG_BUILD}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/share/zxtune

  cp -f ${PKG_BUILD}/usr/bin/xtractor ${INSTALL}/usr/bin
  cp -f ${PKG_BUILD}/usr/bin/zxtune123 ${INSTALL}/usr/bin
  cp -f ${PKG_DIR}/config/* ${INSTALL}/usr/share/zxtune
  
  cp -f ${PKG_DIR}/scripts/start_zxtune.sh ${INSTALL}/usr/bin

  chmod +x ${INSTALL}/usr/bin/*
}
