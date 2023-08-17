## Basic photogrammetry tasks Ⅱ
注：本次任务中使用的数据来自某气象雷达天线的摄影测量实验，接续Basic tasks of photogrammetry Ⅰ。

**任务5：三角交会测量（Triangulation）**

当有两个相机从交会角度看到了空间点X，而且分别成像至不同像面的x1和x2位置，那么如果再给定两个相机的投影矩阵P1和P2，那么就可以通过数学方法计算空间点的的坐标值X。
在一对匹配像点处将投影方程展开可得：
![image.png](https://cdn.nlark.com/yuque/0/2023/png/25481822/1685981803306-5cc4c07e-1672-483d-9ff5-853ce611bd2c.png#averageHue=%23f5efef&clientId=u7f93d35b-e544-4&from=paste&height=217&id=u85c73c13&originHeight=232&originWidth=487&originalType=binary&ratio=1.0700000524520874&rotation=0&showTitle=false&size=23097&status=done&style=none&taskId=u4f35d8fd-9a01-4940-8a19-9d070e14383&title=&width=455.1401646046246)

其中红色方框内的数据可根据已知条件计算得到，解这样一个超定方程便可得到空间点的三维坐标，在’./data’文件目录下有两占位相机的匹配点，可使用上述方程实现对匹配点对的三维重建。

	重建函数可见 FunTriangulate.m
	可视化重建结果可见testMain.m

**任务6：解析法求解基础矩阵F**

像面目标点只有在完成匹配工作后，才能将它们的坐标输入交会测量的模块求解空间坐标信息。在摄影测量中，用于匹配的目标点只包含了它们在像面上的坐标信息，因此对于它们的匹配是困难的（对于机器视觉采集的图像，可以结合特征点周围的纹理、颜色、形状等信息辅助匹配）。

极线约束关系提供了一种匹配像面目标点的有效方法，它将匹配点的搜索范围从整个像面降低到一条直线，是目前摄影测量中使用最为广泛的匹配技术，使用极线约束完成匹配的前提是求解基础矩阵F。

![image.png](https://cdn.nlark.com/yuque/0/2023/png/25481822/1685981894564-8db724cb-9b56-4ed0-9380-a324dbcb6286.png#averageHue=%23f8f8f8&clientId=u7f93d35b-e544-4&from=paste&height=751&id=u666d4d7f&originHeight=804&originWidth=521&originalType=binary&ratio=1.0700000524520874&rotation=0&showTitle=false&size=48908&status=done&style=none&taskId=u76d55e50-099e-4755-9684-5548cff2a18&title=&width=486.91586398153885)

	解析法求解基础矩阵F函数见FunFundamentalMatrix.m
	函数实现见testMain.m

**任务7：数值法求解基础矩阵F**

使用数值方法求解基础矩阵F的推导过程如下
根据投影方程，由8对匹配的像点可得：

![image.png](https://cdn.nlark.com/yuque/0/2023/png/25481822/1685981946736-a8ad2338-3993-471b-9f40-32b9aa6c6d44.png#averageHue=%23f1f1f1&clientId=u7f93d35b-e544-4&from=paste&height=110&id=u05474a1f&originHeight=118&originWidth=488&originalType=binary&ratio=1.0700000524520874&rotation=0&showTitle=false&size=14717&status=done&style=none&taskId=u203b766a-207c-4448-a46a-26febb78a6c&title=&width=456.07474399806324)

当已知匹配像点对大于8时，系数矩阵的行数可以大于8，解上述方程的超定形式即可得到基础矩阵F的等比例数值解。

	数值法法求解基础矩阵F函数可见FunFundamentalMatrix2.m
	函数实现可见testMain.m

**任务8：使用基础矩阵F绘制极线**

![image.png](https://cdn.nlark.com/yuque/0/2023/png/25481822/1685982015727-9049a718-5dad-4bb1-9a3b-2508412d1b52.png#averageHue=%23f1f1f1&clientId=u7f93d35b-e544-4&from=paste&height=144&id=u229c2b1d&originHeight=154&originWidth=548&originalType=binary&ratio=1.0700000524520874&rotation=0&showTitle=false&size=8753&status=done&style=none&taskId=uc2e494c2-061b-48c9-b960-2ef33da9340&title=&width=512.1495076043825)

	绘制极线可见testMain.m
