SOURCE="https://libreoffice.soluzioniopen.com/stable/full/LibreOffice-fresh.full-x86_64.AppImage"
DESTINATION="LibreOffice.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION)  --continue $(SOURCE)
	chmod +x $(DESTINATION)
	./$(DESTINATION) --appimage-extract
	rm -f squashfs-root/libreoffice6.4-startcenter.png
	rm -f squashfs-root/startcenter.desktop
	cp icon.svg squashfs-root/libreoffice6.4-startcenter.svg
	cp startcenter.desktop squashfs-root/startcenter.desktop
	export ARCH=x86_64 && bin/appimagetool.AppImage squashfs-root $(DESTINATION)
	rm -rf squashfs-root
	chmod +x $(DESTINATION)
