#！/bin/bash
#author：九月(keence)
#说明：遍历家目录下视频文件夹下视频，并在视频目录下转音频（video to audio）。然后软连接至音乐目录
#闲话：为了解决下的音乐视频听歌用的视频播放器老是手贱点X想放后台结果直接对出这件事，那就转音频用音乐播放器吧_(:3」∠)_

cd /home/lm/视频/【av55471216】【花園セレナ】勾指起誓♪日语版【B站限定】
IFS=$'\n'
#for var in file 表示变量var在file中循环取值．取值的分隔符由$IFS确定．
#设定IFS的取值以换行符分隔.

for line in $(find . -name '*mp4')
do
    file=${line##*/}
    #echo $file
    audio=${file%.*}
    dir=${line%/*}
    #echo $dir
    cd $dir
    ffmpeg -i $file -map 0:1 -acoder mp3 -b:a 320k  -vn $audio.mp3
    dir=$(readlink -f .)
    #获取当前目录绝对路径
    ln -s $dir/$audio.mp3 ~/音乐/$audio.mp3
done
