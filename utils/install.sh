#!/bin/sh
#
# install.sh - Copyright (c) 2018-2025 - Olivier Poncet
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#

# ----------------------------------------------------------------------------
# variables
# ----------------------------------------------------------------------------

opt_prefix="${PREFIX:-/usr}"
opt_bindir="${DESTDIR}${opt_prefix}/bin"
opt_shrdir="${DESTDIR}${opt_prefix}/share"

# ----------------------------------------------------------------------------
# files
# ----------------------------------------------------------------------------

opt_src01="./bin/pve-autosnap"
opt_dst01="${opt_bindir}/pve-autosnap"
opt_src02="./share/bash-completion/completions/pve-autosnap"
opt_dst02="${opt_shrdir}/bash-completion/completions/pve-autosnap"

# ----------------------------------------------------------------------------
# debug
# ----------------------------------------------------------------------------

set -x

# ----------------------------------------------------------------------------
# create directories
# ----------------------------------------------------------------------------

mkdir -p "${opt_bindir}"                                             || exit 1
mkdir -p "${opt_shrdir}"                                             || exit 1
mkdir -p "${opt_shrdir}/bash-completion/completions"                 || exit 1

# ----------------------------------------------------------------------------
# install files
# ----------------------------------------------------------------------------

install -m 755 "${opt_src01}" "${opt_dst01}"                         || exit 1
install -m 644 "${opt_src02}" "${opt_dst02}"                         || exit 1

# ----------------------------------------------------------------------------
# End-Of-File
# ----------------------------------------------------------------------------
