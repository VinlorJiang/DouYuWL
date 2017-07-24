## 1. 小码哥王红云，coderwhy
## 2.iOS任务：
1）视频播放；
2）录播；
3）即时通信；
4）弹幕；
5）界面搭建
## 3.技术分析：
1）界面展示：秀场界面，游戏界面
2）技术
## 3.项目部署：
1）github新建仓库；
2）从github下载或者命令行，cd到目录，然后git clone +仓库地址
## 4.获取app图片资源：
1）下载ipa资源包，使用pp助手：应用游戏-》正版应用-》搜索斗鱼-》下载-》下载管理可以查看下载信息-》打开ipa包-》打开方式-》归档使用工具-》.app包-》右键显示包内容
2）打开Assets.car包资源工具，github上搜cartool，解压car，运行该工具，Edit Scheme-》Arguments-》Arguments Pass On Lanuch 下面+-》将Assets.car拖进输入框，然后将将要存放资源到路径拖到下面输入框

## 6.项目框架搭建
6.1 图标必须有60x60的；
6.2 文件夹目录划分；
6.3 storyboard refactor ，iOS 9.0以上
6.4 适配iOS 8.0

## 7.设置首页导航栏：
7.1 类方法
7.2 系统类扩充构造函数：没有返回值，以convenience开头，必须调用一个设计构造函数
7.3 通过在类型后面添加 “ =“” ”创建方法默认参数，如：string = “”，

## 8.界面分析：
8.1 label可以根据文本计算宽度，但是button不是很方便计算
8.2 封装PageTitleView
8.3 封装PageContentView
8.4 处理PageTitleView与PageContentView逻辑
8.5 重写了init函数必须重写init with coder 
8.6 swift没有隐式转换

## 15.
  15.1 在xib或者storyboard中，选择某张图片然后按等于号“=”与command就会根据图片的大小来显示
## 18:
###   18.1 swift不再支持静态库了，只支持动态库；
###   18.2 在终端命令下安装第三方库文件，而又不需要更新本地库的话可以在后面加 “--no-repo-update”，完整命令如：pod isntall --no-repo-update
###   18.3 测试网络请求http://httpbin.org
###   18.4 UICollectionView，如果没有实现代理方法的话，会有报错，先实现代理方法在查看是否还有报错

## 21: 
    21.1. ??的使用，当需要传入的是一个确定类型而传入的是一个可选类型时候，可以用两个问号后面加一个类型为空的默认值，如： A ?? "hello", 表示当A为空的时候就使用hello；
    21.2 as！强转类型

# 1.CGPointZero -> CGPoint.zero,CGPointZero在 swift 3不可用
# 2.在添加PageTitleView的时候，文本都没有显示出来的原因是没有调整UIScrollView的内边距，设置： automaticallyAdjustsScrollViewInsets = false ，就可以解决
# 3.颜色渐变的设置逻辑：
## 3.1使用RGB,定义一个常量元组分别来保存sourceColor与targetColor；
## 3.2当sourceColor变到targetColor时：用sourceColor的RGB分别加上targetColor的RGB的进度；
## 3.3当targetColor变到sourceColor时：用targetColor的RGB分别减去sourceColor的RGB的进度；
# 3.当下面collectionView滚动后再去点击PageTitleView的label时，原label颜色没有改变到normal状态，是代理方法没有将目标的index赋值给当前label的 index。
# 4.在提交git的时候提示“The local repository is out of date”，解决方案：cd到当前项目目录，输入：git pull --rebase xxx master，然后git push即可。
# 下一节课：19.MVVM设计模式
