# vim: set ts=4 sw=4 et:

vopt_if() {
    local name="build_option_$1" t="$2" f="$3"
    if [ ${!name} ]; then
        echo -n "$t"
    else
        echo -n "$f"
    fi
}

vopt_with() {
    local opt="$1" flag="${2:-$1}"
    vopt_if "$opt" "--with-${flag}" "--without-${flag}"
}

vopt_enable() {
    local opt="$1" flag="${2:-$1}"
    vopt_if "$1" "--enable-${flag}" "--disable-${flag}"
}

vopt_conflict() {
    local opt1="$1" opt2="$2" n1="build_option_$1" n2="build_option_$2"
    if [ "${!n1}" -a "${!n2}" ]; then
        msg_error "options '${opt1}' and '${opt2}' conflict\n"
    fi
}
