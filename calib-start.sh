# This file is part of the KDAB Nautical UI demo.
#
# SPDX-FileCopyrightText: 2013-2021 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
#
# SPDX-License-Identifier: MIT
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
