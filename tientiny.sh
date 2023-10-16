#!/bin/bash
if [[ "$1" == "--remove" ]]; then
	rm -rf ~/.oh-my-zsh ~/.plugins;
	rm -rf ~/.bashrc;
	chsh -s bash;
	termux-reload-settings;
	kill -9 $PPID
fi
spin () {

local pid=$!
local delay=0.25
local spinner=( '▰▱▱▱▱' '▰▰▱▱▱' '▰▰▰▱▱' '▰▰▰▰▱' '▰▰▰▰▰' )

while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do

for i in "${spinner[@]}"
do
	tput civis
	echo -ne "\033[34m\r[*] Đang Tải Xuống.. Vui Lòng Chờ.........\e[33m[\033[32m$i\033[33m]\033[0m   ";
	sleep $delay
	printf "\b\b\b\b\b\b\b\b";
done
done
printf "   \b\b\b\b\b"
tput cnorm
printf "\e[1;33m [Xong]\e[0m";
echo "";

}
COPY_FILES() {
	version=`getprop ro.build.version.release | sed -e 's/\.//g' | cut -c1`
	version1=`getprop ro.build.version.release`
        rm -rf ~/.draw ~/.termux/*
        cp .object/.draw .object/.bashrc ~/;
	rm -rf ~/.termux;
        mkdir -p ~/.termux/;
        if [[ "$version" -le 7 ]]; then
                rm -rf $PREFIX/share/figlet/ASCII-Shadow.flf
                cp .object/color*.* .object/font*.* ~/.termux/
                cp .object/termux.properties2 ~/.termux/termux.properties
                cp .object/ASCII-Shadow.flf $PREFIX/share/figlet/
		cp .banner.sh ~/
		termux-reload-settings

        else
                rm -rf $PREFIX/share/figlet/ASCII-Shadow.flf
                cp .object/color*.* .object/font*.* ~/.termux/;
                cp .object/ASCII-Shadow.flf $PREFIX/share/figlet/
                cp .object/termux.properties ~/.termux/
		cp .banner.sh ~/
		termux-reload-settings
        fi
	if [[ "$version1" -eq 10 ]] || [[ "$version1" -eq 11 ]]; then
		rm -rf $PREFIX/share/figlet/ASCII-Shadow.flf
		cp .object/color*.* .object/font*.* ~/.termux/;
		cp .object/termux.properties ~/.termux/
		cp .object/ASCII-Shadow.flf $PREFIX/share/figlet/
		cp .banner.sh ~/
		termux-reload-settings
	fi
}
rubygem_d () {
dpkg -s ruby2 &> /dev/null
if [[ $? -eq 0 ]]; then
	apt install --reinstall ruby2 -y;
	gem install lolcat*.gem &> /dev/null
else
	apt install --reinstall ruby -y;
	gem install lolcat*.gem &> /dev/null
fi
	
}
# lưu ý đây chỉ in 7 ký tự
echo "";
echo -e "\e[1;34m[*] \e[32mCài Đặt Gói....\e[0m";
echo "";
(apt update -y && apt upgrade -y) &> /dev/null;
apt install figlet pv ncurses-utils binutils coreutils wget git zsh termux-api procps gawk exa termux-tools -y &> /dev/null;
rubygem_d &> /dev/null
termux-wake-lock;
if [ -e $PREFIX/share/figlet/MinhTien.flf ]; then
	echo -e "\e[1;34m[*] \033[32mMinhTien.flf Phông Chữ Figlet Hiện Diện\033[0m";
	sleep 4
else
wget https://raw.githubusercontent.com/remo7777/MinhTien/master/MinhTien.flf &> /dev/null;
sleep 3
cp MinhTien.flf $PREFIX/share/figlet/MinhTien.flf;
cp ASCII-Shadow.flf $PREFIX/share/figlet/ASCII-Shadow.flf;
sleep 3
rm MinhTien.flf
fi
THEADER () 
{
clear;
echo -e "\033[01;32m
MinhTien (2023)
		
	Menu
+---------------------------*/
.......Terminal-Header-TienTiny......
+---------------------------*/
Chỉ Dành Cho Người Dùng....
\033[0m";
ok=0
while [ $ok = 0 ];
do
	echo ""
tput setaf 3
read -p "Vui Lòng Nhập Tên: " PROC
tput sgr 0
if [[ ${#PROC} -gt 8 ]]; then
	echo -e "\e[1;34m[*] \033[32mKý Tự Quá Dài Bạn Đã Nhập...\033[0m"
	echo ""
	echo -e "\033[32mVui Lòng Nhập Ít Hơn \033[33m9 \033[32mTên Của Bạn\033[0m" | pv -qL 10;
	echo ""
	sleep 4
	clear
echo -e "\033[01;32m
MinhTien (2023)

	Menu
+---------------------------*/
.......Terminal-Header-TienTiny......
+---------------------------*/
Chỉ Dành Cho Người Dùng....
\033[0m";
	echo ""
	echo -e "\e[1;34m \033[32mVui Lòng Nhập Ít Hơn 9 Ký Tự...\033[0m"
	echo ""
else
	ok=1
fi
done
clear
#echo "NAME=$PROC" > ~/.username
TNAME="$PROC";
col=$(tput cols)
echo ;
#figlet -f ASCII-Shadow "$PROC" | lolcat;
bash ~/T-TienTiny/.banner.sh ${col} ${TNAME}
echo "";
echo -e '\e[0;35m▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱\e[00m';
echo -e '\033[1;43;30m###Hãy Đăng Ký Kênh YouTube Của Tôi !!### \033[0m';
echo -e '\033[1;43;30m###https://youtube.com/@tientinyhebi_it### \033[0m';
echo -e '\e[0;35m▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱▱\e[00m';
echo "";
echo -e "
\033[0;31m┌─[\033[1;34m$TNAME\033[1;33m@\033[1;36mtermux\033[0;31m]─[\033[0;32m~${PWD/#"$HOME"}\033[0;31m]
\033[0;31m└──╼ \e[1;31m❯\e[1;34m❯\e[1;90m❯\033[0m "

tput setaf 3
read -p  "Bạn Có Muốn Thiết Lập Thử Nghiệm ? (y/n) " PROC32
tput sgr 0
if [[ ${PROC32} == [Y/y] ]]; then
	if [ -e $HOME/T-TienTiny.txt ]; then
		rm $HOME/T-TienTiny.txt;
	fi

	if [ -d $HOME/T-TienTiny ]; then
	cd $HOME/T-TienTiny
	fi
#if [ -e $HOME/.zshrc ]; then
#	rm -rf ~/.zshrc
#else
cat >> ~/.zshrc <<-EOF
tput cnorm
clear
## terminal banner
#figlet -f ASCII-Shadow.flf "$PROC" | lolcat;
echo
## cursor
printf '\e[4 q'
## prompt
TNAME="$PROC"
setopt prompt_subst

PROMPT=$'
%{\e[0;31m%}┌─[%{\e[1;34m%}%B%{\${TNAME}%}%{\e[1;33m%}@%{\e[1;36m%}termux%b%{\e[0;31m%}]─[%{\e[0;32m%}%(4~|/%2~|%~)%{\e[0;31m%}]%b
%{\e[0;31m%}└──╼ %{\e[1;31m%}%B❯%{\e[1;34m%}❯%{\e[1;90m%}❯%{\e[0m%}%b '

## Replace 'ls' with 'exa' (if available) + some aliases.
if [ -n "\$(command -v exa)" ]; then
        alias l='exa'
        alias ls='exa'
        alias l.='exa -d .*'
        alias la='exa -a'
        alias ll='exa -Fhl'
        alias ll.='exa -Fhl -d .*'
else
        alias l='ls --color=auto'
        alias ls='ls --color=auto'
        alias l.='ls --color=auto -d .*'
        alias la='ls --color=auto -a'
        alias ll='ls --color=auto -Fhl'
        alias ll.='ls --color=auto -Fhl -d .*'
fi

## Safety.
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=39'
ZSH_HIGHLIGHT_STYLES[comment]=fg=226,bold
cols=\$(tput cols)
bash ~/.banner.sh \${cols} \${TNAME}
EOF
#fi
COPY_FILES
chsh -s zsh;
source ~/.zshrc;
else
	echo -e "\033[32mHy Vọng Bạn Thích Công Việc Của Tôi..\033[0m"
fi
exit
}

clear;
echo -e "\033[31m$(figlet -f MinhTien "T- TienTiny")\e[0m"
echo -e "\e[1;32m
+----------------------------------*/
MinhTien : (\e[33m14.4.2023\e[32m)

1. Tien Tiny
2. Zsh-syntax-highlight (\e[33mBổ Sung\e[01;32m)
3. Zsh-command-autosuggest (\e[33mBổ Sung\e[01;32m)
4. Terminal-Header
5. Lời Nhắc PS1 Tùy Chỉnh ( \e[33mTốt Nhất\e[1;32m )
+----------------------------------*/
\033[0m";
tput setaf 3;
read -p  "Bạn Có Muốn Thiết Lập Cái Này Không ? (y/n) " PROC33

tput sgr 0
if [[ ${PROC33} == [Y/y] ]]; then


ozsh=0
if [ -d $HOME/.oh-my-zsh ]; then
	(rm -rf $HOME/.oh-my-zsh/) &> /dev/null
	(rm $HOME/.zshrc) &> /dev/null
elif [ -d $HOME/.zsh ]; then
	(rm -rf $HOME/.zsh) &> /dev/null
else
	echo -e "\e[1;34m[*] \e[32mBạn Không oh-my-zsh...\e[0m";
fi
while [ $ozsh = 0 ];
do
	echo -e "\e[1;34m[*] \e[32mOh-my-zsh Thiết Lập Mới....\e[0m";
	echo "";

	( rm -rf ~/.zshrc;git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh;cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc";termux-wake-unlock; ) &> /dev/null & spin;
	chsh -s zsh;
if [ -d $HOME/.oh-my-zsh ];
then
	ozsh=1
else
	echo -e "\e[1;34m[*] \e[32mtải xuống thất bại số 2..tôi sẽ thử lại..\e[0m";

fi
done

echo -e "\e[1;34m[*] \e[32mZsh-thiết lập plugin tự động gợi ý..\e[0m";

zshau=0
(rm -rf ~/.plugins) &> /dev/null

mkdir -p ~/.plugins/zsh-autosuggestions
mkdir -p ~/.plugins/zsh-syntax-highlighting
#cd $HOME/.plugins/

while [ $zshau = 0 ];
do
	( git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.plugins/zsh-autosuggestions; echo "source ~/.plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc; ) &> /dev/null & spin
	if [ -d $HOME/.plugins/zsh-autosuggestions ];
then
	zshau=1

else

echo -e "\e[1;34m[*] \e[32mtải xuống không thành công..tôi sẽ thử lại..\e[0m";

fi
done
zshsyx=0

#cd $HOME/.plugins/

while [ $zshsyx = 0 ];
do
echo -e "\e[1;34m[*] \e[32mZsh-syntax-thiết lập highlighter....\e[0m";
	( git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.plugins/zsh-syntax-highlighting; echo "source ~/.plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc; ) &> /dev/null & spin

if [ -d $HOME/.plugins/zsh-syntax-highlighting ];then
	zshsyx=1
else
	echo -e "\e[1;34m[*] \e[32mtải xuống không thành công..tôi sẽ thử lại..\e[0m";

fi
done




	THEADER
	
	
else
	echo -e "\e[1;34m[*] \033[32mHy vọng bạn thích công việc của tôi..\033[0m"
	exit
fi
exit 0
