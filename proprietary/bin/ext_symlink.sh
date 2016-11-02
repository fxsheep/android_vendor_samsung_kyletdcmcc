#!/system/bin/sh

term="/dev/pts/* "

if [ "$1" = "-p" ]; then
	link=`getprop sys.symlink.pty null`
	if [ "$link" != "null" ]; then
		rm ${link##${term}}
		ln -s $link;
		setprop sys.symlink.notify 0
	fi
elif [ "$1" = "-u" ]; then
	link=`getprop sys.symlink.umts_router`
	if [ -f ${link##${term}} ]; then
		rm ${link##${term}}
	fi
	ln -s $link;
fi
