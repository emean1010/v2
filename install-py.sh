apt update

# 装依赖
apt-get install -y python3-pip
pip3 install flask

python3 test.py

echo 'succsss'
echo 'ip'
hostname -I