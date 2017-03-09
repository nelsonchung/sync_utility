#find . ! -path "*.svn*" -name "*.c" -o -name "*.h" -exec grep --color -n $1 {} + 
#file_type="\(-name \"*.c\" -o \"*.h\" -o \"*.cpp\" -o \"*.java\" -o \"*.aidl\"\)"
#find . -type f ! -path "*.svn*" $file_type -exec grep --color -n "$1" {} + 
find . -type f ! -path "*.svn*" \( -name "*.h" -o -name "*.c" -o -name "*.aidl" -o -name "*.java" \) -exec grep --color -n "$1" {} + 
