#Ubuntu 13.04 VPS

read -p  "Create ssh log [Enter]" 
cat /var/log/auth.log | grep Accepted >> /home/root/ssh_log.log

add-apt-repository ppa:gviz-adm/graphviz-dev
apt-get update

read -p  "install apt-get crap [Enter]"
apt-get install -y autoconf build-essential git-core scons libboost-dev libboost-python-dev libboost-thread-dev libboost-system-dev libtool mongodb python-chardet python-cssutils python-dev python-html5lib python-httplib2 python-zope.interface python-pymongo python-pefile python-setuptools zlib1g-dev libncurses5-dev python-lxml bison flex software-properties-common aptitude python-pip git build-essential g++ subversion nano

sudo easy_install beautifulsoup4

read -p  "cd opt [Enter]"
cd /opt/

read -p  "v8 [Enter]"
svn checkout http://v8.googlecode.com/svn/trunk/ v8
svn checkout http://pyv8.googlecode.com/svn/trunk/ pyv8

read -p  "thug [Enter]"
cd /opt/
git clone git://github.com/buffer/thug.git
read -p  "patch thug [Enter]"
cp thug/patches/PyV8-patch1.diff .
read -p  "patch thug2 [Enter]"
patch -p0 < PyV8-patch1.diff 

read -p  "pyv8 [Enter]"
export V8_HOME=/opt/v8
cd /opt/
cd pyv8
python setup.py build
python setup.py install

read -p  "libemu [Enter]"
cd /opt/
git clone git://git.carnivore.it/libemu.git
cd libemu/
autoreconf -v -i
./configure --enable-python-bindings --prefix=/opt/libemu
make install
ldconfig -n /opt/libemu/lib
cd /opt/

read -p  "pylibemu [Enter]"
cd /opt/
git clone git://github.com/buffer/pylibemu.git
cd pylibemu/
sh -c "echo /opt/libemu/lib > /etc/ld.so.conf.d/pylibemu.conf"
python setup.py build
python setup.py install
cd /opt/

read -p  "Magic [Enter]"
cd /opt/
git clone git://github.com/ahupp/python-magic.git
cd python-magic
python setup.py build
python setup.py install

read -p  "libemu fix [Enter]"
cd /opt/
touch /etc/ld.so.conf.d/libemu.conf
echo "/opt/libemu/lib/" > /etc/ld.so.conf.d/libemu.conf
ldconfig

read -p  "Yara [Enter]"
cd /opt/
git clone git://github.com/plusvic/yara.git
cd yara
chmod +x build.sh
./build.sh
make install
ldconfig
cd yara-python
python setup.py build
python setup.py install
cd /opt/

read -p  "easyinstall time [Enter]"
easy_install pefile
easy_install chardet
easy_install httplib2
easy_install cssutils
easy_install zope.interface
easy_install mongodb
easy_install pymongo 
easy_install jsbeautifier
easy_install rarfile
easy_install simplejson
easy_install lxml
easy_install pydot
