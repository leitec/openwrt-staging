. /lib/kirkwood.sh

platform_check_image() {
	[ "$#" -gt 1 ] && return 1
	local board="$(kirkwood_board_name)"
	local magic="$(get_magic_long "$1")"

	case "$board" in
	"ea4500")
		nand_do_platform_check $board $1
		return $?
		;;
	"dir665")
		[ "$magic" != "27051956" ] && {
			echo "Invalid image type."
			return 1
		}
		return 0
		;;
	esac

	echo "Sysupgrade is not yet supported on $board."
	return 1
}

platform_do_upgrade() {
	local board="$(kirkwood_board_name)"

	case "$board" in
	"dir665")
		PART_NAME="kernel:rootfs"
		default_do_upgrade "$ARGV"
		;;
	esac
}
