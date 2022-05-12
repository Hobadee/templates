#!/usr/bin/env bash

#
# This is a template for bash scripts
# By Eric Kincl
# https://github.com/Hobadee/templates
#


##
# usage() will be run when this script is run with the -h (help) options or when
# incorrect arguments are passed.
#
# The text in this cuntion should be updated with appropriate information as your
# program is built.
#
# By convention, example usage strings have the following format:
# programname -x <arg> [-y <arg>] [-z]
# Where:
# "-w <arg>" is a required option with a required argument
# "[-y <arg>]" is an optional argument with a required argument
# "-z" is an optional argument
#
# The way this script template works doesn't support required options with optional arguments
#
usage(){
cat <<EOF
Usage:
$0
-h	 Show this help text and exit
EOF
}


# Set initiol option states
#
# You should create variables for all program options here and initialize them
# to a false/null value so you can later check if they have been set or not.
HELP=false


# The options to allow
#
# This is a list of chars to allow as options.  If the char is followed by a colon (":")
# then that option will require an argument.  Only single-char options are allowed.
# Long options are not supported by `getopts`
#
# The initial colon (":") is required
OPTIONS=:h

# Loop through all options and 
while getopts $OPTIONS OPTION
do
    case $OPTION in
        h)HELP=true
          ;;
# If the option has a variable, set the variable equal to the passed variable
# so you have it later
#        o)OPTVAR=$OPTARG
#          ;;
        \?)
            # An invalid option has been passed
            # Inform the user, print usage, and quit
            echo "Invalid option: -$OPTARG" >&2
            usage
            exit 1
            ;;
	:)
        # An option has been passed without the required argument
        # Inform the user, print usage, and quit
	    echo "Option -$OPTARG requires an argument." >&2
        usage
	    exit 1
	    ;;
    esac
done


#
# Check the option variables we set above and process them as needed
#

if [ $HELP = true ]; then
    echo "Help"
    usage
    exit 0
fi

