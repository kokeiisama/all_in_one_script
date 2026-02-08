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
#xray by @Misaka
#https://github.com/Misaka-blog
#https://owo.misaka.rest
#
#
#old BBR by @千影,@cx9208
#https://www.94ish.me/ 
#https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master
#
#
#new BBR by @jinwyp
#https://github.com/jinwyp/one_click_script
#
#
#MTProxy by ellermister
#https://github.com/ellermister/mtproxy
#
#
#warp by fscarmen
#https://github.com/fscarmen/warp
#https://gitlab.com/fscarmen/warp
#
#special thanks to all above
#

#script name
shadowsocks='shadowsocks_all.sh'
v2ray_233='v2ray_233.sh'
#v2ray_hijk='v2ray_hijk.sh'
xray_hijk='xray_hijk.sh'
bbr_old='bbr_old.sh'
bbr_new='bbr_new.sh'
one_click='one_click.sh'
hysteria2='hysteria.sh'

mtproxy='mtproxy.sh'
warp='warp.sh'
yg_warp='yg_warp.sh'
all_in_one='all_in_one.sh'

#save path
save_path='/root'
mtproxy_path='/root/mtproxy'

#URL
url_shadowsocks='https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh'
url_v2ray_233='https://git.io/v2ray.sh'
#url_v2ray_hijk='https://s.hijk.art/v2ray.sh'
#url_xray_hijk='https://s.hijk.art/xray.sh'
#url_xray_hijk='https://cdn.jsdelivr.net/gh/Misaka-blog/Xray-script@master/xray.sh'
url_one_click_jinwyp='https://raw.githubusercontent.com/jinwyp/one_click_script/master/trojan_v2ray_install.sh'
url_xray_hijk='https://raw.githubusercontent.com/Misaka-blog/xray-script/main/xray.sh'
url_bbr_old='https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh'
url_bbr_new='https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh'
url_mtproxy='https://raw.githubusercontent.com/ellermister/mtproxy/master/mtproxy.sh'
url_warp='https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh'
url_ygwarp='https://raw.githubusercontent.com/yonggekkk/warp-yg/main/CFwarp.sh'
url_hysteria2='https://raw.githubusercontent.com/Misaka-blog/hysteria-install/main/hy2/hysteria.sh'
url_all_in_one='https://raw.githubusercontent.com/kokeiisama/all_in_one_script/main/all_in_one.sh'


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


download_mtp(){
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

mtproxyDir(){
	mkdir $mtproxy_path
	cd $mtproxy_path
}

noChangeRootPermission(){
	if [ -s $hysteria2 ];then
		sed -i 's/chmod -R 777 \/root/#&/' $hysteria2
	fi
		grep -n "#chmod -R 777 /root" $hysteria2
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
	#colorEcho $GREEN "#https://hijk.art"
	#colorEcho $GREEN "#https://v2raytech.com/v2ray-all-in-one-script-vless-tcp-xtls-support/"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	#colorEcho $GREEN "#xray by @hijk"
	#colorEcho $GREEN "#https://hijk.art"
	#colorEcho $GREEN "#https://v2raytech.com/xray-one-click-script/"
	colorEcho $GREEN "#xray by @Misaka"
	colorEcho $GREEN "#https://github.com/Misaka-blog"
	colorEcho $GREEN "#https://owo.misaka.rest"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	#colorEcho $GREEN "#BBR by @千影,@cx9208"
	#colorEcho $GREEN "#https://www.94ish.me/" 
	#colorEcho $GREEN "#https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master"
	colorEcho $GREEN "#new BBR by @jinwyp"
	colorEcho $GREEN "#https://github.com/jinwyp/one_click_script"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $GREEN "#MTProxy by @ellermister"
	colorEcho $GREEN "#https://github.com/ellermister/mtproxy"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $GREEN "#warp by @fscarmen"
	colorEcho $GREEN "#https://github.com/fscarmen/warp"
	colorEcho $PLAIN "#"
	colorEcho $PLAIN "#"
	colorEcho $RED   "#special thanks to all above"
	colorEcho $PLAIN "###"
	
	colorEcho $YELLOW "请选择要下载的脚本... \n"
	#select script in Shadowsocks V2ray_233 V2ray_hijk Xray_hijk BBR MTProxy Warp Exit
	#do
	colorEcho $GREEN "[1] Shadowsocks all in one By Teddysun"
	colorEcho $GREEN "[2] V2ray_233 By 233Boy"
	#colorEcho $GREEN "[3] V2ray_hijk By 网络跳跃(hijk.art)"
	colorEcho $GREEN "[3] Xray_hijk By 网络跳跃(hijk.art)"
	colorEcho $GREEN "[4] one_click by @jinwyp"
	colorEcho $RED "[50] BBR By 千影&cx9208" $RED "NOT RECOMMENDED"
	colorEcho $GREEN "[5] new BBR by @jinwyp"
	colorEcho $GREEN "[6] MTProxy By ellermister"
	colorEcho $GREEN "[7] Warp By fscarmen"
	colorEcho $GREEN "[71] ygWarp By yonggekkk"
	colorEcho $GREEN "[8] hysteria2 By misaka"
	colorEcho $GREEN "[9] Update"
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
		# 3) colorEcho $BLUE "选择了V2ray_hijk \n"
		# download $v2ray_hijk $url_v2ray_hijk
		# checkFile $v2ray_hijk
		#;;
		3) colorEcho $BLUE "选择了Xray_hijk \n"
		download $xray_hijk $url_xray_hijk
		checkFile $xray_hijk
		;;
		50) colorEcho $BLUE "选择了BBR_OLD \n"
		download $bbr_old $url_bbr_old
		checkFile $bbr_old
		;;
		4) colorEcho $BLUE "选择了One_click \n"
		download $one_click $url_one_click_jinwyp
		checkFile $one_click
		;;
		5) colorEcho $BLUE "选择了BBR_NEW \n"
		download $bbr_new $url_bbr_new
		checkFile $bbr_new
		;;
		6) colorEcho $BLUE "选择了MTproxy \n"
		mtproxyDir
		download_mtp $mtproxy $url_mtproxy
		checkFile $mtproxy
		;;
		7) colorEcho $BLUE "选择了Warp \n"
		download $warp $url_warp
		checkFile $warp
		;;
		71) colorEcho $BLUE "选择了ygWarp \n"
		download $yg_warp $url_ygwarp
		checkFile $yg_warp
		;;
		8) colorEcho $BLUE "选择了Hysteria2 \n"
		download $hysteria2 $url_hysteria2
		noChangeRootPermission
		checkFile $hysteria2
		;;
		9) colorEcho $BLUE "updating \n"
		download $all_in_one $url_all_in_one
		checkFile $all_in_one
		;;
		0) colorEcho $BLUE "Bye.. \n"
	esac
	#done
}

start


