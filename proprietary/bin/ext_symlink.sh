#!/system/bin/sh

term="/dev/pts/* "

if [ "$1" = "-p" ]; then
	timeout=25
	while [ "$timeout" -ge 0 ] ; do 
		link=`getprop sys.symlink.pty`
		if [ ! -z ${link##${term}} ]; then
			ln -sf $link;
		    setprop sys.symlink.notify 0
		  break;
		fi
		sleep 1
		timeout=$((timeout - 1))
	done
elif [ "$1" = "-u" ]; then
	link=`getprop sys.symlink.umts_router`
	if [ -f ${link##${term}} ]; then
		rm ${link##${term}}
	fi
	ln -s $link;
fi
