#!/bin/bash

# Nexcess.net TwoFactorAuth Extension for Magento
# Copyright (C) 2014  Nexcess.net L.L.C.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

### CHANGE THESE ###
EXTENSION_DEV='Nexcessnet'
EXTENSION_NAME='Twofactorauth'
####################

BASE_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

XML_PATH_VERSION="/config/modules/${EXTENSION_DEV}_${EXTENSION_NAME}/version/text()"
CONFIG_XML_PATH="app/code/community/${EXTENSION_DEV}/${EXTENSION_NAME}/etc/config.xml"

echo '<root/>' | xpath -e '*' &>/dev/null
if [ $? -eq 2 ]; then
    XPATH_BIN='xpath'
else
    XPATH_BIN='xpath -e'
fi

echo "$($XPATH_BIN "$XML_PATH_VERSION" \
    < "${BASE_DIR}/${CONFIG_XML_PATH}" \
    2> /dev/null)"
