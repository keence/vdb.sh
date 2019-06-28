#！/bin/bash
#author：九月(keence)

video=$1
web=${video#*/video/}
web=${web%'?f'*}
video=${web%'/'*}
video=${video%'?'*}
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
echo "尝试更换格式下载"
#you-get "https://www.bilibili.com/video/$web" -o ~/视频/【${video}】${str} --format=flv$resolution
you-get "https://www.bilibili.com/video/$web" -o ~/视频/【${video}】${str}
result=$?
if [ $result == 0 ]
then
bash ~/vdb.sh/pdb.sh "$video" "$str"
else
echo "无选择的格式$resolution"
fi
;;
*)
echo "未统计错误：$result"
result=0
esac
else
bash ~/vdb.sh/pdb.sh "$video" "$str"
fi
else
echo "请检查网址或者网络链接"
fi
echo "执行完成"

