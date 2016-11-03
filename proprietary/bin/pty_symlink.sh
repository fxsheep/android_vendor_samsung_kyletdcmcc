#!/system/bin/sh

term="/dev/pts/* "
num=0
if [ "$1" = "-p" ]; then
while [ "$num" -le 25 ] ; do 
	link=`getprop sys.symlink.pty`
	if [ -f ${link##${term}} ]; then
		rm ${link##${term}}
	fi
	ln -s $link;
	setprop sys.symlink.notify 0
num=$((num + 1))
done
fi
