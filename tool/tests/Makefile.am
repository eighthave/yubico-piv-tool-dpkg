# Copyright (c) 2014 Yubico AB
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

TESTS_ENVIRONMENT = export VERSION=$(PACKAGE_VERSION); export EXEEXT=$(EXEEXT);
TESTS_ENVIRONMENT += $(VALGRIND)

AM_CFLAGS = $(WARN_CFLAGS)
AM_CPPFLAGS = -I$(top_srcdir)/lib -I$(top_builddir)/lib
AM_CPPFLAGS += -I$(top_srcdir)/tool -I$(top_builddir)/tool
AM_CPPFLAGS += $(OPENSSL_CFLAGS)

AM_LDFLAGS = -no-install

parse_name_LDADD = ../libpiv_util.la $(OPENSSL_LIBS)

check_PROGRAMS = parse_name
TESTS = basic.sh $(check_PROGRAMS)

if ENABLE_COV
AM_LDFLAGS += --coverage
endif
