# vdb.sh
适配B站的you-get脚本

自动根据av号和标题在 ～/视频 下分类保存，方便管理查找、自动同步

19.4.21补充说明：

如果是从搜索页进入视频，地址将类似于https://www.bilibili.com/video/av44689307?from=search&seid=7924668100199429519这样

因‘&’在bash的特殊含义，将导致脚本后台运行、部分显示异常、wget下载保存log文件

作为对应：

1.终端内复制地址后，删除search后部分，如：vdb https://www.bilibili.com/video/av44689307?from=search ，或者vdb https://www.bilibili.com/video/av44689307?fro也行，处理上没区别，不过至少保留问号后的f(及'?f')作为脚本处理的标记

2.脚本内wget操作目录改至/tmp目录，重命名完成后在mv到视频目录

[博客](https://blog.lolicon.world/?p=92)

19.4.20更新：

添加视频封面下载（但愿封面地址插入值不是不是随机的(;¬_¬)

前置设置：

安装you-get

在～目录下执行： git clone https://github.com/keence/vdb.sh.git

编辑～/.bashrc文件，在对应位置添加：  alias vdb='bash ~/vdb.sh/vdb.sh'

编辑完成后需注销登录生效，或者执行 alias vdb='bash ~/vdb.sh/vdb.sh'

使用：

格式 vdb [网址或者av号]  [分辨率]

例如：vdb https://www.bilibili.com/video/av44596341 720

或者：vdb av47717798

不带分辨率执行you-get默认选项
