# This software is a part of the A.O.D apprepo project
# Copyright 2015 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
SOURCE="https://libreoffice.soluzioniopen.com/stable/full/LibreOffice-fresh.full-x86_64.AppImage"
DESTINATION="LibreOffice.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	chmod +x $(DESTINATION)

	./$(DESTINATION) --appimage-extract

	rm -f squashfs-root/libreoffice*-startcenter.png
	rm -f squashfs-root/startcenter.desktop

	cp --force libreoffice.svg squashfs-root/
	cp --force startcenter.desktop squashfs-root/startcenter.desktop
	cp --force AppRun squashfs-root/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage squashfs-root $(DESTINATION)
	chmod +x $(DESTINATION)

	rm -rf squashfs-root
