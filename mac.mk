# Copyright (C) 2014 Yubico AB
# All rights reserved.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# Additional permission under GNU GPL version 3 section 7
#
# If you modify this program, or any covered work, by linking or
# combining it with the OpenSSL project's OpenSSL library (or a
# modified version of that library), containing parts covered by the
# terms of the OpenSSL or SSLeay licenses, We grant you additional 
# permission to convey the resulting work. Corresponding Source for a
# non-source form of such a combination shall include the source code
# for the parts of OpenSSL used as well as that of the covered work.

PACKAGE=yubico-piv-tool

all: usage mac

.PHONY: usage
usage:
	@if test -z "$(VERSION)" || test -z "$(PGPKEYID)"; then \
		echo "Try this instead:"; \
		echo "  make PGPKEYID=[PGPKEYID] VERSION=[VERSION]"; \
		echo "For example:"; \
		echo "  make PGPKEYID=2117364A VERSION=1.6.0"; \
		exit 1; \
	fi

doit:
	rm -rf tmp && mkdir tmp && cd tmp && \
	mkdir -p root/licenses && \
	cp ../$(PACKAGE)-$(VERSION).tar.gz . && \
	tar xfz $(PACKAGE)-$(VERSION).tar.gz && \
	cd $(PACKAGE)-$(VERSION)/ && \
	./configure --prefix=$(PWD)/tmp/root && \
	make install check && \
	install_name_tool -id @executable_path/../lib/libykpiv.dylib $(PWD)/tmp/root/lib/libykpiv.dylib && \
	install_name_tool -id @executable_path/../lib/libykpiv.1.dylib $(PWD)/tmp/root/lib/libykpiv.1.dylib && \
	install_name_tool -change $(PWD)/tmp/root/lib/libykpiv.1.dylib @executable_path/../lib/libykpiv.1.dylib $(PWD)/tmp/root/bin/yubico-piv-tool ; \
	if otool -L $(PWD)/tmp/root/lib/*.dylib $(PWD)/tmp/root/bin/* | grep '$(PWD)/tmp/root' | grep -q compatibility; then \
		echo "something is incorrectly linked!"; \
		exit 1; \
	fi && \
	cp COPYING $(PWD)/tmp/root/licenses/$(PACKAGE).txt && \
	cd .. && \
	cd root && \
	zip -r ../../$(PACKAGE)-$(VERSION)-mac.zip *

mac:
	$(MAKE) -f mac.mk doit CHECK=check

upload-mac:
	@if test ! -d "$(YUBICO_GITHUB_REPO)"; then \
		echo "yubico.github.com repo not found!"; \
		echo "Make sure that YUBICO_GITHUB_REPO is set"; \
		exit 1; \
		fi
	gpg --detach-sign --default-key $(PGPKEYID) \
		$(PACKAGE)-$(VERSION)-mac.zip
	gpg --verify $(PACKAGE)-$(VERSION)-mac.zip.sig
	$(YUBICO_GITHUB_REPO)/publish $(PACKAGE) $(VERSION) $(PACKAGE)-$(VERSION)-mac.zip*
