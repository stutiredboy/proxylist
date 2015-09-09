WORKDIR=/home/tiredboy/proxylist
AUTOPROXYLIST="https://autoproxy-gfwlist.googlecode.com/svn/trunk/gfwlist.txt"
TMPFILE=`mktemp`
wget -O - ${AUTOPROXYLIST} 2>/dev/null | base64 -d | sed '/EOF/d' > ${TMPFILE}
if [ $? -eq 0 ] ; then
	cat ${WORKDIR}/custom.list >> ${TMPFILE}
	base64 ${TMPFILE} > ${TMPFILE}.url.txt
	if [ $? -eq 0 ] ; then
		mv ${TMPFILE}.url.txt ${WORKDIR}/url.txt
	fi
fi
rm -f ${TMPFILE}
rm -f ${TMPFILE}.url.txt
