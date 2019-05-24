#！/bin/bash
#author：九月(keence)
#说   明：调用vdb批量下载处理，vid.txt中文件不要换行。
#废话部分：本来参考kankore的collection简写，想命名成kore的，又感觉不对劲有歧义，而且日式英语味儿太重。
#        那就依旧随兴clc这样吧- -

char=$(cat vid.txt)
#echo $char
#declare -a av
#i=1
tmp=${char%av*}
while [ $tmp ]
do
    #av[$i]=${char#"$tmp"}
    #echo ${av[$i]}
    #char=$tmp
    #tmp=${tmp%av*}
    #((i++))
    av=${char#"$tmp"}
    echo $av
    bash ~/vdb.sh/vdb.sh $av
    char=$tmp
    tmp=${tmp%av*}
done
echo $char
bash ~/vdb.sh/vdb.sh $char
