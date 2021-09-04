#!/usr/bin/env bash

# read the options
TEMP=`getopt -o f:s::d:a:: --long file-name:,source::,destination:,action:: -- "$@"`
eval set -- "$TEMP"

# extract options and their arguments into variables.
while true ; do
    case "$1" in
        -f|--file-name)
            fileName=$2 ; shift 2 ;;
        -s|--source)
            case "$2" in
                "") sourceDir='.' ; shift 2 ;;
                 *) sourceDir=$2 ; shift 2 ;;
            esac ;;
        -d|--destination)
            destinationDir=$2 ; shift 2;;
        -a|--action)
            case "$2" in
                "copy"|"move") action=$2 ; shift 2 ;;
                            *) action="copy" ; shift 2 ;;
            esac ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

# Now take action
echo "$action file $fileName from $sourceDir to $destinationDir"
echo "-f or --file-name: Parameter is mandatory (indicated by :)"
echo "-s or --source: Parameter is options (indicated by ::), default current directory"
echo "-d or --destination: Parameter is mandatory"
echo "-a or --action (Copy): Parameter is options default is copy"
