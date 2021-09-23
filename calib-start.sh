# This file is part of the KDAB Nautical UI demo.
#
# SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
#
# SPDX-License-Identifier: AGPL-3.0-only
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>
#
# Contact info@kdab.com for more information about this software.
#
#!/bin/sh
start-hid () 
{ 
           if [ -e ${CALIBFILE?} ]; then
              echo "${CALIBFILE} already exists"
              return 0;
           fi
           
           #Run calib
           echo "Running screen-calib..."
           screen-calib -z20 -bc -f${CALIBFILE?}
}

start-hid;
