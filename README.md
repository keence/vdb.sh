# vdb.sh
适配B站的you-get脚本

自动根据av号和标题在 ～/视频 下分类保存，方便管理查找、自动同步


前置设置：

在～目录下执行： git clone https://github.com/keence/vdb.sh.git

编辑～/.bashrc文件，在对应位置添加：  alias vdb='bash /home/usr/vdb.sh/vdb.sh'

编辑完成后需注销登录生效，或者执行 alias vdb='bash /home/usr/vdb.sh/vdb.sh'

使用：

格式 vdb [网址或者av号]  [分辨率]

例如：vdb https://www.bilibili.com/video/av44596341 720

或者：vdb av47717798

不带分辨率执行you-get默认选项
