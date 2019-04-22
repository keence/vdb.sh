#！/bin/bash
#author：九月(keence)

#第一参数av号，第二参数视频标题

pic=$1
titel=$2
tmp="$titel"
echo ""
echo "将开始下载封面："
echo ""
str1=$(curl "https://search.bilibili.com/all?keyword=$pic")
tmp1=${str1#*'","description"'}
tmp2=${str1%'u002Farchive\u002F'*}
str1=${str1%"$tmp1"}
str1=${str1#"$tmp2"}
str1=${str1##*u002F}
str1=${str1%%'"'*}
cd /tmp
wget https://i2.hdslb.com/bfs/archive/$str1
if [ $? != 0 ]
then
echo "获取封面地址失败"
elif [ $tmp ]
then
tmp1=${str1#*.}
tmp2=${str1%.*}
mv "${tmp2}.${tmp1}" "${titel}.${tmp1}"
mv "${titel}.${tmp1}" ~/视频/【${pic}】${titel}
else
tmp1=${str1#*.}
tmp2=${str1%.*}
mv "${tmp2}.${tmp1}" "${pic}.${tmp1}"
mv "${pic}.${tmp1}" ~/图片/B站/
while [ $? != 0 ]
do
echo "创建目录:~/图片/B站"
mkdir ~/图片/B站/
mv "${pic}.${tmp1}" ~/图片/B站/
done
fi
