#!/bin/bash
#
#
# Copyright (c) 2019 Iñaki Garitano (igaritano@garitano.org)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#######################################################################
#
# Description:
#
# This file contains the code to read a given input file line by line
# and to write it into an output file. Each line is read in a given
# time (seconds) interval. For debugging purposes each line is
# printed to the standard output.
# The program firsts evaluates the number of lines the given input
# file has. Then, within a loop, it reads the corresponding line
# number and it appends into a given output file. Moreover, it
# prints the line into the standard output. Finally, it waits
# (sleep) for a given amount of time (in seconds).
#
# Arguments:
#  1.- input file
#  2.- output file
#  3.- time interval in seconds
#
# ./datasources.sh input_file output_file time_interval
#
######################################################################

number_of_lines=`/usr/bin/wc -l $1 | /bin/sed -e 's/'"$1"'//'`

for i in `/usr/bin/seq 1 $number_of_lines`;
do
        line=`/bin/sed -n $i'p' $1`
        /bin/echo $line >> $2
        /bin/echo $line
        /bin/sleep $3
done
