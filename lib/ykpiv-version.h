/*
 * Copyright (c) 2014 Yubico AB
 * All rights reserved.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * Additional permission under GNU GPL version 3 section 7
 *
 * If you modify this program, or any covered work, by linking or
 * combining it with the OpenSSL project's OpenSSL library (or a
 * modified version of that library), containing parts covered by the
 * terms of the OpenSSL or SSLeay licenses, We grant you additional 
 * permission to convey the resulting work. Corresponding Source for a
 * non-source form of such a combination shall include the source code
 * for the parts of OpenSSL used as well as that of the covered work.
 *
 */

#ifndef YKPIV_VERSION_H
#define YKPIV_VERSION_H

#ifdef __cplusplus
extern "C"
{
#endif

	/**
	 * YKPIV_VERSION_STRING
	 *
	 * Pre-processor symbol with a string that describe the header file
	 * version number.  Used together with ykneomgr_check_version() to verify
	 * header file and run-time library consistency.
	 */
#define YKPIV_VERSION_STRING "0.1.5"

	/**
	 * YKPIV_VERSION_NUMBER
	 *
	 * Pre-processor symbol with a hexadecimal value describing the header
	 * file version number.  For example, when the header version is 1.2.3
	 * this symbol will have the value 0x01020300.  The last two digits
	 * are only used between public releases, and will otherwise be 00.
	 */
#define YKPIV_VERSION_NUMBER @YKPIV_VERSION_NUMBER@

	/**
	 * YKPIV_VERSION_MAJOR
	 *
	 * Pre-processor symbol with a decimal value that describe the major
	 * level of the header file version number.  For example, when the
	 * header version is 1.2.3 this symbol will be 1.
	 */
#define YKPIV_VERSION_MAJOR @YKPIV_VERSION_MAJOR@

	/**
	 * YKPIV_VERSION_MINOR
	 *
	 * Pre-processor symbol with a decimal value that describe the minor
	 * level of the header file version number.  For example, when the
	 * header version is 1.2.3 this symbol will be 2.
	 */
#define YKPIV_VERSION_MINOR @YKPIV_VERSION_MINOR@

	/**
	 * YKPIV_VERSION_PATCH
	 *
	 * Pre-processor symbol with a decimal value that describe the patch
	 * level of the header file version number.  For example, when the
	 * header version is 1.2.3 this symbol will be 3.
	 */
#define YKPIV_VERSION_PATCH @YKPIV_VERSION_PATCH@

	const char *ykpiv_check_version (const char *req_version);


#ifdef __cplusplus
}
#endif

#endif
