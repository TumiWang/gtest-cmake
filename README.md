# 概述

这个项目是演示， cmake在编译的过程中运行gtest的例子
cmake的编译过程一般按顺序分为
1. make
2. build
3. run test
4. install

该项目演示在第二步, build时，运行test, 并且在test运行失败时终止
PS: 
+ 第三步和第四步非必需
+ 该例子就是演示第二步和第三步合并

该演示的核心功能是cmake/RunGTestBuilding.cmake文件

# 运行方法

rebuild.bat和rebuild.sh分别是对应平台的编译脚本

生成的目录build, 是编译位置
生成的目录prefix, 是安装位置
