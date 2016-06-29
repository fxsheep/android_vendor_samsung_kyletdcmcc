#!/system/bin/sh

term="/dev/pts/* "

if [ "$1" = "-p" ]; then
	link=`getprop sys.symlink.pty`
	if [ -f ${link##${term}} ]; then
		rm ${link##${term}}
	fi
	ln -s $link;
	setprop sys.symlink.notify 0
elif [ "$1" = "-u" ]; then
	link=`getprop sys.symlink.umts_router`
	if [ -f ${link##${term}} ]; then
		rm ${link##${term}}
	fi
	ln -s $link;
fi
