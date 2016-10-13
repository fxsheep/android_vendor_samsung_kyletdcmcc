#!/system/bin/sh

term="/dev/pts/* "

if [ "$1" = "-u" ]; then
	link=`getprop sys.symlink.umts_router`
	if [ -f ${link##${term}} ]; then
		rm ${link##${term}}
	fi
	ln -s $link;
fi
