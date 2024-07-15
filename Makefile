Size := $(shell du -k isoloader | awk '{print $$1}')
deb:
	install -D -t /tmp/isoloader/usr/bin/ isoloader
	install -D -t /tmp/isoloader/DEBIAN/ control
	sed -i 's/Installed-Size: 0/Installed-Size: $(Size)/g' /tmp/isoloader/DEBIAN/control
	dpkg-deb --build /tmp/isoloader/ isoloader.deb
	rm -rf /tmp/isoloader/
install:
	install -D -t /usr/local/bin/ isoloader
uninstall:
	rm /usr/local/bin/isoloader
clean:
	rm -rf isoloader.deb /tmp/isoloader/
	
