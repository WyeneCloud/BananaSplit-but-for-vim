#!/bin/bash

function cat_readme() {
    echo ""
    echo "Usage: ./coding-style.sh DELIVERY_DIR REPORTS_DIR"
    echo "       DELIVERY_DIR      Should be the directory where your project files are"
    echo "       REPORTS_DIR       Should be the directory where we output the reports"
    echo "                         Take note that existing reports will be overriden"
    echo ""
}

function banana_split() {
    CURRENT_FILE=".c"
    echo -e "${Yellow}BANANA NA NA NA NA${Color_Off}"
    while read p; do
        IFS=':' read -ra ADDR <<< "$p"
        if [ "$CURRENT_FILE" != "${ADDR[0]}" ]; then
            echo ‣ In file "${ADDR[0]}"
            CURRENT_FILE="${ADDR[0]}"
        fi
        if [ "${ADDR[2]}" = " MAJOR" ]; then
            echo -ne "${Red}[Major]"
        elif [ "${ADDR[2]}" = " MINOR" ]; then
            echo -ne "${Yellow}[MINOR]"
        elif [ "${ADDR[2]}" = " INFO" ]; then
            echo -ne "${Cyan}[INFO]"
        fi
        error=${ADDR[3]: 2}
        echo -ne " ($error)${Color_Off} - ${errors[${error}]^}."
        echo -e " ${IBlack}(${ADDR[0]: 2}:${ADDR[1]})${Color_Off}"
    done < $1
    echo -e "${Yellow}BANANA SPLIT${Color_Off}"
}

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Yellow='\033[0;33m'       # Yellow
Cyan='\033[0;36m'         # Cyan
IBlack='\033[0;90m'       # Black

declare -A errors

errors=(
["A3"]="file not ending with a line break (\\\\n)"
["C1"]="conditional block with more than 3 branches, or at a nesting level of 3 or more"
["C3"]="use of 'goto' keyword"
["F2"]="function name not following the snake_case convention"
["F3"]="line of more than 80 columns"
["F4"]="line part of a function with more than 20 lines"
["F5"]="function with more than 4 parameters"
["F6"]="function with empty parameter list"
["F8"]="comment inside function"
["F9"]="nested function defined"
["G1"]="file not starting with correctly formatted Epitech standard header"
["G2"]="zero, two, or more empty lines separating implementations of functions"
["G3"]="bad indentation of preprocessor directive"
["G4"]="global variable used"
["G5"]="'include' directive used to include file other than a header"
["G6"]="carriage return character (\\r) used"
["G7"]="trailing space"
["G8"]="leading or trailing empty line"
["H1"]="bad separation between source file and header file"
["H2"]="header file not protected against double inclusion"
["L2"]="bad indentation at the start of a line"
["L3"]="misplaced or missing space(s)"
["L4"]="misplaced curly bracket"
["O1"]="compiled, temporary or unnecessary file"
["O3"]="more than 5 functions in a single file"
["O4"]="file name not following the snake_case convention"
["V1"]="identifier name not following the snake_case convention"
)

if [ $# == 1 ] && [ $1 == "--help" ]; then
    cat_readme
elif [ $# = 2 ];
then
    DELIVERY_DIR=$(readlink -f "$1")
    REPORTS_DIR=$(readlink -f "$2")
    EXPORT_FILE="$REPORTS_DIR"/coding-style-reports.log
    ### delete existing report file
    rm -f "$EXPORT_FILE"

    ### Pull new version of docker image and clean olds
    sudo docker pull ghcr.io/epitech/coding-style-checker:latest && sudo docker image prune -f

    ### generate reports
    sudo docker run --rm -i -v "$DELIVERY_DIR":"/mnt/delivery" -v "$REPORTS_DIR":"/mnt/reports" ghcr.io/epitech/coding-style-checker:latest "/mnt/delivery" "/mnt/reports"
    # [[ -f "$EXPORT_FILE" ]] && echo "$(wc -l < "$EXPORT_FILE") coding style error(s) reported in "$EXPORT_FILE", $(grep -c ": MAJOR:" "$EXPORT_FILE") major, $(grep -c ": MINOR:" "$EXPORT_FILE") minor, $(grep -c ": INFO:" "$EXPORT_FILE") info"

    banana_split $EXPORT_FILE
else
    cat_readme
fi
