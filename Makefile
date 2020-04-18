SOURCE="https://libreoffice.soluzioniopen.com/stable/full/LibreOffice-fresh.full-x86_64.AppImage"
DESTINATION="LibreOffice.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION)  -c $(SOURCE)
	chmod +x $(DESTINATION)
	./$(DESTINATION) --appimage-extract
	rm squashfs-root/libreoffice6.4-startcenter.png
	cp icon.svg squashfs-root/libreoffice6.4-startcenter.svg
	export ARCH=x86_64 && bin/appimagetool.AppImage squashfs-root $(DESTINATION)
	rm -rf squashfs-root
	chmod +x $(DESTINATION)
