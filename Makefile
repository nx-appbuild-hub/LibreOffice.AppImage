SOURCE="https://libreoffice.soluzioniopen.com/stable/full/LibreOffice-fresh.full-x86_64.AppImage"
DESTINATION="LibreOffice.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	chmod +x $(DESTINATION)

	./$(DESTINATION) --appimage-extract

	rm -f squashfs-root/libreoffice6.4-startcenter.png
	rm -f squashfs-root/startcenter.desktop

	cp --force libreoffice.svg squashfs-root/
	cp --force startcenter.desktop squashfs-root/startcenter.desktop
	cp --force AppRun squashfs-root/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage squashfs-root $(DESTINATION)
	chmod +x $(DESTINATION)

	rm -rf squashfs-root
