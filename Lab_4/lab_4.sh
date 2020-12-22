#1. 
sudo yum group install “Development Tools” 

#2. 
cp /mnt/windows/bastet-0.43.tgz /root/lab4/ 
cd /root/lab4
tar zxvf bastet-0.43.tgz 
sudo yum install boost-devel
sudo yum install ncurses-devel 
make
./bastet 
# через nano дописываем в конец файла строку
install: 
      cp ./$(PROGNAME) /usr/bin/
	  
#3. 
sudo yum list | cut -f1 -d” “ > task3.log

#4. 
sudo yum install yum-utils
repoquery --requires --resolve gcc > task4_1.log
repoquery -q --installed --whatrequires libgcc > task4_2.log

#5. 
mkdir /root/localrepo
cp /mnt/windows/checkinstall-1.6.2-3.e16.1.x86_64.rpm /root/localrepo/checkinstall-1.6.2-3.e16.1.x86_64.rpm
createrepo /root/localrepo
nano /etc/yum.repos.d/local.repo
[LocalRepo]
name=LocalRepo
baseurl=file:///root/lab4/localrepo
enabled=1
gpgcheck=0

#6. 
yum repolist > /root/lab4/task6.log

#7. 
sed -i ‘s/enabled=1/enabled=0/’ /etc/yum.repos.d/Centos-*
yum repolist
yum list available
yum install checkinstall

#8. 
cp /mnt/windows/fortunes-ru_1.52-2_all.deb /root/lab4/fortunes-ru_1.52-2_all.deb
alien --to-rpm fortunes-ru_1.52-2_all.deb
tar -ihv fortunes-ru_1.52-3.noarch.rpm --force

#9. 
yumdownloader —source nano
rpm -iv nano-2.3.1-10.e17.src.rpm
cd rpmbuild/SPECS
nano nano.spec
# добавляем строку
ln -s "nano" "%{buildroot}/%{_bindir}/newnano"
yum install groff
rpmbuild -bb nano.spec
yum localinstall RPMS/x86_64/nano-2.3.1-10.e17.rpm
