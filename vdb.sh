#！/bin/bash
#author：九月(keence)

video=$1
web=${video#*/video/}
video=${web%/?*}
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
while [ $result != 0 ]
do
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
done
else
echo "请检查网址或者网络链接"
fi
echo "执行完成"

