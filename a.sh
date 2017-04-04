
#!/bin/bash


echo -e "\033[32m###################################\033[0m"
echo -e "\033[32m##\033[0m  \033[31m欢迎使用Hellmessage脚本文件\033[0m  \033[32m##\033[0m"
echo -e "\033[32m###################################\033[0m"
echo -e "\033[32m###\033[0m    \033[34m1.从GIT更新Socket脚本\033[0m    \033[32m###\033[0m"
echo -e "\033[32m###\033[0m    \033[34m2.手动编写Socket脚本\033[0m     \033[32m###\033[0m"
echo -e "\033[32m###\033[0m    \033[34m3.重新运行Socket脚本\033[0m     \033[32m###\033[0m"
echo -e "\033[32m###\033[0m    \033[34m4.监听Socket运行状态\033[0m     \033[32m###\033[0m"
echo -e "\033[32m###################################\033[0m"
echo -e "\033[32m###\033[0m    \033[34m请输入对应的数字运行\033[0m     \033[32m###\033[0m"
echo -e "\033[32m###################################\033[0m"



read Data
if [ $Data = 1 ];then
        cd /usr/local/nginx/html/Socket/
        rm -rf Socket/
        php start.php stop
        git clone https://github.com/Hellmessage/Socket.git
        cp /usr/local/nginx/html/Socket/Socket/start.php /usr/local/nginx/html/Socket/
        php start.php start -d
        clear
        echo -e "\033[32m重启启动Socket ---- OK\033[0m"
elif [ $Data = 2 ];then
        vi /usr/local/nginx/html/Socket/start.php
elif [ $Data = 3 ];then
        cd /usr/local/nginx/html/Socket/
        php start.php stop
        php start.php start -d
        clear
        echo -e "\033[32mSocket@ReStart ---- OK\033[0m"
elif [ $Data = 4 ];then
        cd /usr/local/nginx/html/Socket/
        while [ true ]; do
                sleep 5
                php start.php status
        done
else
        echo "请输入正确的编码"
fi