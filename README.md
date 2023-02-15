# recos(plot genomic characteristics and collinearity) user manual
### 1. Quick start

> Install Singularity in your OS, you can refer <https://docs.sylabs.io/guides/latest/user-guide/quick_start.html>.
>
> git clone https://github.com/zhk2017/recos.git
>
> download base img from https://www.wenshushu.cn/k/ai1gotf28oz  Keychain access document wss:2LilFaNCrIZIYUMhhwadutZReYh

### 2. Example dataset
There are five example dataset for beginers,  change  the directory into the tutorials data path, and *sh run.sh*. when the job is finished, a SVG format picture will be generated. You can use Chromo browser to open it. 

*perl recos_wrapper.pl -c example.ini -o example*

 *-c configure file for plot*
 
 *-o output fileanme, auto add .svg suffix*

### 3. Cofingure file
        [canvas]   #用于定义整个画布的大小、图形方向、图形元素所在的位置和大小等
        width  = 2000  #画布宽度，像素
        height = 1200  #画布高度，像素
        direction = vertical  #图形元素的方向，水平或垂直
        axis_ratio = 0.05  #坐标轴占画布的大小，0.05表示占总大小的5%，举例：如果direction为水平，表示占高度的5%
        name_ratio = 0.05  #染色体名称占画布的大小
        margin = 10,10,10,10  #画布四周留白的大小，像素
        inner_ratio = 0.15,0.2,0.3,0.2,0.15 #每个染色体对占一个区域，里面分为5部分，详见后面对参数的说明
        
        [axis]
        canvas_position = left  #坐标轴在画布中的位置，举例：如果direction为水平，则只能是上或下
        ticks_minor = 1Mb  #坐标轴中较短刻度的步长
        ticks_major = 5Mb  #坐标轴较长刻度的步长
        ticks_minor_len = -5  #较短刻度的长度，像素，负值可以调整方向
        ticks_major_len = -10 #较长刻度的长度，像素，负值可以调整方向
        axis_line = 0.7  #以坐标轴区域为参考，坐标轴主线在里面的位置，举例：0.5表示居中
        axis_color = rgb(0,0,0)  #坐标轴颜色
        axis_label = 0.2  #以坐标轴区域为参考，刻度标签名称所在位置
        axis_label_size = 12  #刻度标签名称的大小，像素
        axis_label_color = rgb(0,255,255)  #刻度标签名称的颜色
        axis_width = 1  #坐标轴线条宽度
        axis_opacity = 1 #坐标轴线条透明度
        label_unit = Mb  #刻度标签名称的单位
        
        [chromosome]
        canvas_position = bottom  #展示染色体比较的绘图元素在画布中的位置
        chromosome_list = /data/example/ref_query.list  #定义染色体比较关系、条带颜色、染色体长度、透明度、比较ID等
        chroms = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 #比较ID的列表在chromosome_list定义，指定展示顺序
        name_position = center  #染色体名称标签的位置
        
        >[ref_out1]  #定义参考基因组外侧要展示的图形元素
        file =/data/PAV/ref.bed
        type = hist  #以直方图展示
        pos0 = 0  #起始位置，最小为0
        pos1 = 1  #终止位置，最大为1，可以是小数
        low_color = rgb(0,0,0) #低位色
        color = rgb(0, 0, 255)  #颜色
        high_color =rgb(0, 0, 255) #高位色
        min = 100  #绘图时的最小值
        max = 5000  ##绘图时的最大值
        
        [ref_in1]  #定义参考基因组条带内部要展示的图形元素
        file = /data/example/gly.gc.bed
        type = heatmap  #以热图展示
        pos0 = 0
        pos1 = 1
        low_color = rgb(255,255,255)
        color = rgb(0, 0, 255)
        high_color =rgb(255, 0, 0)
        min = 0.3
        max = 0.5
        
        [qry_in1] #定义查询基因组条带内部要展示的图形元素
        file =/data/PAV/query.bed
        type = hist
        pos0 = 0
        pos1 = 1
        low_color = rgb(0,0,0)
        color = rgb(255, 0, 0)
        high_color =rgb(255, 0, 0)
        min = 100
        max = 5000
        
        [link1]  #定义染色体对的共线性关系，文件内部可以设置共线性块的颜色，来区分是否时SV，以????????
        coord = /data/coords.txt



### 4. Figure 

*example1*  cd tutorials/example1 && sh run.sh

![plot1](https://i.hd-r.cn/a93bfbda731dc90c3e1ec6cbdce8d78c.png)

*example2*  cd tutorials/example2 && sh run.sh
![plot2](https://cdn.hd-r.cn/e2f52c3dca83c0a94edefb75f5db643f.png)

*example3*  cd tutorials/example3 && sh run.sh
![plot3](https://i.hd-r.cn/de4bcdb49f9e80252e7903af941a88a0.png)

*example4*  cd tutorials/example4 && sh run.sh
![plot4](https://i.hd-r.cn/9804487edc613bfab55bca0f5b101275.png)

*example5*  cd tutorials/example5 && sh run.sh
![plot5](https://i.hd-r.cn/f61b4240138904c37ee282829ba8597f.png)
