#！/bin/bash
#author：九月(keence)

str=$(curl 'https://www.bilibili.com/video/av44689307?from=search&seid=7924668100199429519')
#echo "$str" > /tmp/tmp2
tmp1=${str#*'","description"'}
#echo "$tmp1" > /tmp/tmp1
tmp2=${str%'u002Farchive\u002F'*}
str=${str%"$tmp1"}
str=${str#"$tmp2"}
#echo "$str" > /tmp/tmp
str=${str##*u002F}
str=${str%%'"'*}
echo $str
#cd /tmp
#wget https://i2.hdslb.com/bfs/archive/$str
#echo $?
