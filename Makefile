#
# Makefile - Copyright (c) 2018-2024 - Olivier Poncet
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
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# ----------------------------------------------------------------------------
# global targets
# ----------------------------------------------------------------------------

all : all_pve_autosnap
	@echo "=== $@ ok ==="

clean : clean_pve_autosnap
	@echo "=== $@ ok ==="

install : install_pve_autosnap
	@echo "=== $@ ok ==="

uninstall : uninstall_pve_autosnap
	@echo "=== $@ ok ==="

buildpackage :
	dpkg-buildpackage -b --no-sign
	@echo "=== $@ ok ==="

# ----------------------------------------------------------------------------
# all pve-autosnap
# ----------------------------------------------------------------------------

all_pve_autosnap :
	@true

# ----------------------------------------------------------------------------
# clean pve-autosnap
# ----------------------------------------------------------------------------

clean_pve_autosnap :
	@true

# ----------------------------------------------------------------------------
# install pve-autosnap
# ----------------------------------------------------------------------------

install_pve_autosnap :
	./utils/install.sh

# ----------------------------------------------------------------------------
# uninstall pve-autosnap
# ----------------------------------------------------------------------------

uninstall_pve_autosnap :
	./utils/uninstall.sh

# ----------------------------------------------------------------------------
# End-Of-File
# ----------------------------------------------------------------------------
