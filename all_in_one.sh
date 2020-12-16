#!/bin/bash

#all in one script
#
#
#shadowsocks by @teddysun
#https://teddysun.com/486.html
#
#
#v2ray by @233boy and @hijk
#https://github.com/233boy/v2ray
#https://hijk.art
#https://v2raytech.com/v2ray-all-in-one-script-vless-tcp-xtls-support/
#
#
#xray by @hijk
#https://hijk.art
#https://v2raytech.com/xray-one-click-script/
#
#
#BBR by @千影,@cx9208
#https://www.94ish.me/ 
#https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master
#
#special thanks to all above
#

#script name
shadowsocks='shadowsocks_all.sh'
v2ray_233='v2ray_233.sh'
v2ray_hijk='v2ray_hijk.sh'
xray_hijk='xray_hijk.sh'
bbr='bbr.sh'

#save path
save_path='/root'

#URL
url_shadowsocks='https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh'
url_v2ray_233='https://git.io/v2ray.sh'
url_v2ray_hijk='https://s.hijk.art/v2ray.sh'
url_xray_hijk='https://s.hijk.art/xray.sh'
url_bbr='https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh'

#color
RED="\033[31m"      # Error message
GREEN="\033[32m"    # Success message
YELLOW="\033[33m"   # Warning message
BLUE="\033[36m"     # Info message
PLAIN='\033[0m'

colorEcho() {
    echo -e "${1}${@:2}${PLAIN}"
}

checkUser() {
    result=$(id | awk '{print $1}')
    if [[ $result != "uid=0(root)" ]]; then
        colorEcho $RED " 请以root身份执行该脚本"
        exit 1
    fi
}

changeDir(){
	cd $save_path
	pwd
}

download(){
	changeDir
	wget -O ${1} ${2}
	chmod +x ${1}
}

checkFile(){
	if [ -s ${1} ];then
		colorEcho $GREEN "下载成功..."
		read -p "是否运行脚本...[y/n]:" run
		if [ "$run" == "y" ];then
		./$1
		else
		colorEcho $BLUE "Bye \n"
		fi
	else
	colorEcho $RED "下载失败... \n"
	exit 1
	fi
}

start(){
	clear
	checkUser
	
	colorEcho $GREEN "#all in one script"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $GREEN "#shadowsocks by @teddysun"
	colorEcho $GREEN "#https://teddysun.com/486.html"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $GREEN "#v2ray by @233boy and @hijk"
	colorEcho $GREEN "#https://github.com/233boy/v2ray"
	colorEcho $GREEN "#https://hijk.art"
	colorEcho $GREEN "#https://v2raytech.com/v2ray-all-in-one-script-vless-tcp-xtls-support/"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $GREEN "#xray by @hijk"
	colorEcho $GREEN "#https://hijk.art"
	colorEcho $GREEN "#https://v2raytech.com/xray-one-click-script/"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $GREEN "#BBR by @千影,@cx9208"
	colorEcho $GREEN "#https://www.94ish.me/" 
	colorEcho $GREEN "#https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $RED   "#special thanks to all above"
	colorEcho $PLAIN "###"
	
	colorEcho $YELLOW "请选择要下载的脚本... \n"
	#select script in Shadowsocks V2ray_233 V2ray_hijk Xray_hijk BBR Exit
	#do
	colorEcho $GREEN "[1] Shadowsocks all in one By Teddysun"
	colorEcho $GREEN "[2] V2ray_233 By 233Boy"
	colorEcho $GREEN "[3] V2ray_hijk By 网络跳跃(hijk.art)"
	colorEcho $GREEN "[4] Xray_hijk By 网络跳跃(hijk.art)"
	colorEcho $GREEN "[5] BBR By 千影&cx9208"
	colorEcho $GREEN "[0] 退出 \n"
	
	read -p "请选择：" selection
	case $selection in
		1) colorEcho $BLUE "选择了Shadowsocks \n"
		download $shadowsocks $url_shadowsocks
		checkFile $shadowsocks
		;;
		2) colorEcho $BLUE "选择了V2ray_233 \n"
		download $v2ray_233 $url_v2ray_233
		checkFile $v2ray_233
		;;
		3) colorEcho $BLUE "选择了V2ray_hijk \n"
		download $v2ray_hijk $url_v2ray_hijk
		checkFile $v2ray_hijk
		;;
		4) colorEcho $BLUE "选择了Xray_hijk \n"
		download $xray_hijk $url_xray_hijk
		checkFile $xray_hijk
		;;
		5) colorEcho $BLUE "选择了BBR \n"
		download $bbr $url_bbr
		checkFile $bbr
		;;
		0) colorEcho $BLUE "Bye.. \n"
	esac
	#done
}

start


