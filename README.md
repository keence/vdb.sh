# vdb.sh
**适配B站的you-get脚本**

自动根据av号和标题在 ～/视频 下分类保存，方便管理查找、自动同步。详细说明[博客](https://blog.lolicon.world/?p=92)  
[更新日志](https://github.com/keence/vdb.sh/blob/master/update_info.md)

---

**19.4.21 补充说明：**

如果是从搜索页进入视频，地址将类似于`https://www.bilibili.com/video/av44689307?from=search&seid=7924668100199429519`这样  
因‘&’在bash的特殊含义，将导致脚本后台运行、终端部分内容显示异常

故：  
终端内复制地址后，删除search后部分，如：`vdb https://www.bilibili.com/video/av44689307?from=search` ，或者`vdb https://www.bilibili.com/video/av44689307?fro`也行，处理上没区别，不过至少保留问号后的f(即'?f')作为脚本处理的标记

---

**前置设置：**

安装you-get git

在～目录下执行： `git clone https://github.com/keence/vdb.sh.git`  
编辑～/.bashrc文件，在对应位置添加：  `alias vdb='bash ~/vdb.sh/vdb.sh'`与`alias pdb='bash ~/vdb.sh/pdb.sh'`
编辑完成后需注销登录生效，或者执行 `alias vdb='bash ~/vdb.sh/vdb.sh'`与`alias pdb='bash ~/vdb.sh/pdb.sh'`

**使用：**

封面下载：  
格式：pdb [av号]  
例如：`pdb av1212781`  
单独使用下载封面时：  
1.暂不支持完整网址  
2.图片将以av号作为文件名，保存至~/图片/B站/  

视频下载：
格式 vdb [网址或者av号]  [分辨率]  
例如：`vdb https://www.bilibili.com/video/av44596341 720`  
或者：`vdb av47717798`  
不带分辨率执行you-get默认的最高分辨率。分辨率可选项：720、480、360  
封面图片将与视频同名保存至同目录
