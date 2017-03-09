find packages/apps/Bluetooth -type f ! -path "*.svn*" -name "*.*" -exec grep --color -n "$1" {} + 
find hardware/libhardware/include/hardware -type f ! -path "*.svn*" -name "*.*" -exec grep --color -n "$1" {} + 
find system/bt -type f ! -path "*.svn*" -name "*.*" -exec grep --color -n "$1" {} + 
