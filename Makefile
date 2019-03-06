
PREFIX = /usr/local

vul: vul.sh vul.awk vul.tsv
	cat vul.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar cz vul.awk vul.tsv >> $@
	chmod +x $@

test: vul.sh
	shellcheck -s sh vul.sh

clean:
	rm -f vul

install: vul
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f vul $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/vul

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/vul

.PHONY: test clean install uninstall
