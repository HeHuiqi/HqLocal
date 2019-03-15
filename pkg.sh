#!/bin/bash
#自动化编译打包脚本
#相关设置 1.PROJECT->Info->Configuations 点击加号添加自己需要的环境名
# 2.PROJECT->Build Settings->Preprocessor Macros 设置对应环境的键值
#Config  表示服务器环境 Dubug:开发 Prm:预生产 Release:生产
# `pwd` 表示当前路径
#Project_Name 根据工程的名字作修改

# 获取当前目录
currentDir=`pwd`

#用/分割路径
OLD_IFS="$IFS"
IFS="/"
dirNames=($currentDir)
IFS="$OLD_IFS"

#获取数组长度
length=${#dirNames[@]}
echo "分割结果:"${dirNames[@]}
projectName=${dirNames[$length-1]}
echo "项目名称:"$projectName

scheme=$projectName
echo "ppp-"$scheme
#选择环境
choose=0;

if [[ $1 == 'Debug' ]]; then
    choose=1
fi

if [[ $1 == 'Qa' ]]; then
    choose=1
fi
if [[ $1 == 'Release' ]]; then
    choose=1
fi

#获取命令行参数
# $0 是指令文件
# $1 第一个参数
# $2 第二个参数，依此类推

echo '环境：'$1
if [[ $choose == 0 ]]; then
    echo '注意选择环境，用法如下：'
    echo 'sh package.sh  Debug|Qa|Release [0 1]'
    echo '0表示没有使用workspace管理，1表示使用workspace管理(当使用pod管理第三方库时)'
    echo ''
    exit
fi
echo '开始打包。。。'
input=0
if [[  -d $projectName.xcworkspace ]]; then
    input=1
fi
echo $input

# pkg_plist="pkg.plist"
# if [ ! -f $pkg_plist ]
# then
#     /usr/libexec/PlistBuddy -c "print" pkg.plist
#     /usr/libexec/PlistBuddy -c "Add :bundle-identifier string ${projectName}" $pkg_plist
#     /usr/libexec/PlistBuddy -c "Add :bundle-version string 1.0.0" $pkg_plist
#     /usr/libexec/PlistBuddy -c "Add :kind string software" $pkg_plist
#     /usr/libexec/PlistBuddy -c "Add :title string ${projectName}" $pkg_plist
# fi
#
# #编译如果是workspace把-project替换成-workspace即可参数改为$projectName.xcworkspace
# config=$1 #项目模式Debug/Release等
# archivePath= build/$projectName.xcarchive
#
# #注意这里时$2因为 0:pkg.sh 1:debug|qa 2:1or0
# input=$2
# if [ ${input} == 1 ]
# then
# echo 'pod----------------'
# xcodebuild archive \
# -workspace $projectName.xcworkspace \
# -archivePath $projectName \
# -scheme $projectName \
# -configuration $config
# else
# echo 'nopod---------'
# xcodebuild archive \
# -project $projectName.xcodeproj \
# -archivePath $projectName \
# -scheme $projectName \
# -configuration $config
# fi
#
#
# #打包
# exportPath="./ipa/" #archive导出目录(ipa包)
# if [ ! -d $exportPath ]
# then
#   mkdir $exportPath
# fi
# xcodebuild -exportArchive -archivePath ./$projectName.xcarchive \
# -exportPath $exportPath \
# -exportOptionsPlist ./$pkg_plist
#
#
# #打开ipa目录
# #open -R $exportPath
#
# #增加上传git
# HqTestPkg='/Users/hqmac/Desktop/iOSAppTest/web/'
# cp  $exportPath$projectName.ipa ${HqTestPkg}
# cd ${HqTestPkg}
# sh upload_ipa.sh
# #在Finder中打开，在使用中可暂时注释掉避免每次都打开
# open -R .
