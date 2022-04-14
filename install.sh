# 1. 拉代码到 /var/www/v2
# 2. 执行 bash install.sh

apt update

apt install -y git zsh curl nginx

# 开启Google BBR （可选）显示 tcp_bbr 20480 0 这类结果则表示开启成功。
echo 'net.core.default_qdisc=fq' | tee -a /etc/sysctl.conf
echo 'net.ipv4.tcp_congestion_control=bbr' |  tee -a /etc/sysctl.conf
sysctl -p
lsmod | grep bbr

# 安裝和更新 V2Ray
cd /var/www/
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
# 替换 v2ray 设置文件
cp /var/www/v2/config.json /usr/local/etc/v2ray/config.json

# 删掉 nginx default 设置
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default
# 不要再 sites-available 里面放任何东西
cp /var/www/v2/v2.nginx /etc/nginx/sites-enabled/v2

service v2ray restart
service nginx restart

echo 'succsss'
echo 'ip'
hostname -I