#！/bin/bash
#author：九月(keence)

video=$1
web=${video#*/video/}
web=${web%'?f'*}
video=${web%'/'*}
resolution=$2
#获取作为目录名的字符串
str=$(you-get -i https://www.bilibili.com/video/$web)
#保存命令返回值
result=$?
if [ $result == 0 ]
then
#掐头
str=${str#*title:}
#去尾
str=${str%streams*}
#去空格
str=$(echo $str | sed s/[[:space:]]//g)
#转换特殊字符
str=${str//'/'/'-'}
#开始下载
echo ""
echo "将开始下载：https://www.bilibili.com/video/$web"
echo "将保存到目录：~/视频/【${video}】${str}"
echo ""
you-get "https://www.bilibili.com/video/$web" -o ~/视频/【${video}】${str} --format=dash-flv$resolution
#保存命令返回值
result=$?
#返回值判断
if [ $result != 0 ]
then
case $result in
2)
while [ $result == 2 ]
do
echo "默认或选择分辨率格式无效。将打印格式信息："
sleep 3s
you-get -i https://www.bilibili.com/video/$web
read -p "选择格式format(完整输入）：" format
echo ""
echo "将开始下载：https://www.bilibili.com/video/$web"
echo "将保存到目录：~/视频/【${video}】${str}"
echo ""
you-get "https://www.bilibili.com/video/$web" -o ~/视频/【${video}】${str} --format=$format
result=$?
done
;;
*)
echo "未统计错误：$result"
result=0
esac
else
echo ""
echo "将开始下载封面："
echo ""
str1=$(curl "https://search.bilibili.com/all?keyword=$video")
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
else
tmp1=${str1#*.}
tmp2=${str1%.*}
mv "${tmp2}.${tmp1}" "${str}.${tmp1}"
mv "${str}.${tmp1}" ~/视频/【${video}】${str}
fi
fi
else
echo "请检查网址或者网络链接"
fi
echo "执行完成"

