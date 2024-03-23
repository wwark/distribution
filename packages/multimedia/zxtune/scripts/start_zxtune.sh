#!/usr/bin/bash
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024 JELOS (https://github.com/JustEnoughLinuxOS)

. /etc/profile
set_kill set "-9 zxtune"

RUN_DIR="/storage/roms/chiptune"

if [ ! -d "/storage/.config/zxtune/" ]; then
  cp -rf /usr/share/zxtune /storage/.config/
fi

if [ ! -f "/storage/.config/zxtune/zxtune.conf" ]; then
  cp -rf /usr/share/zxtune/zxtune.conf /storage/.config/zxtune
fi

# set resolution
#sed -i '/vid_defheight=/c\vid_defheight='$(fbheight) /storage/.config/gzdoom/gzdoom.ini
#sed -i '/vid_defwidth=/c\vid_defwidth='$(fbwidth) /storage/.config/gzdoom/gzdoom.ini

cd "${RUN_DIR}"
echo "${1}" | xargs /usr/bin/zxtune123 >/var/log/zxtune123.log 2>&1
