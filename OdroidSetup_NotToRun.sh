# Bash: THIS IS NOT A EXECUTABLE SCRIPT. THIS IS AN INSTRUCTABLE.

# UbuntuMATE OS is used here. 
# UbuntuMATE is probably the only relevant distro of Ubuntu that provides GUI on ARM platform, 
# which also has its 16.04 distribution available.

# After First Login, Connect to Wi-fi

# 1. Basics

# Set Time: Time is very important to prevent network issues. 
# Initially just set the correct date. Time can be anything
sudo date MMDDhhmmYYYY.ss 
# Eg. sudo date 102612002019.00
# This has to be repeated every time the system is restarted.

# Set "Apt" Proxy When Needed
sudo echo 'Acquire::http::Proxy "http://172.16.2.30:8080/";' > /etc/apt/apt.conf.d/proxy.conf
sudo echo 'Acquire::https::Proxy "https://172.16.2.30:8080/";' > /etc/apt/apt.conf.d/proxy.conf
sudo echo 'Acquire::ftp::Proxy "ftp://172.16.2.30:8080/";' > /etc/apt/apt.conf.d/proxy.conf

sudo echo 'Acquire::http::Proxy "http://172.16.2.30:8080/";' > /etc/apt/apt.conf
sudo echo 'Acquire::https::Proxy "https://172.16.2.30:8080/";' > /etc/apt/apt.conf
sudo echo 'Acquire::ftp::Proxy "ftp://172.16.2.30:8080/";' > /etc/apt/apt.conf

# Proxy for other command line tools
sudo echo 'export http_proxy="http://172.16.2.30:8080/"' > ~/.bashrc 
sudo echo 'export http_proxy="http://172.16.2.30:8080/"' > ~/.bashrc 
sudo echo 'export http_proxy="http://172.16.2.30:8080/"' > ~/.bashrc 
sudo echo 'export no_proxy="localhost,127.0.0.0,127.0.1.1,10.*.*.*, 192.168.*.*"' > ~/.bashrc 

#Enable SSH
sudo apt-get install upgrade
sudo apt-get install upgrade
# On a fresh image of Ubuntu MATE, SSH doesn't work properly, apparently because it is openSSH. 
sudo apt-get install ssh
sudo systemctl enable ssh

# Enable wireless connection without Local user Login to allow direct SSH
GUI> Go To Edit Connections > Edit the Current Wi-Fi > Allow all users to connect to this network

# Change host name
# Having different names is important to identify odroids when multiple of them are SSHed into.
sudo nano /etc/hostname
sudo nano /etc/hosts


# 2. Installations

# Basic Tools

sudo apt-get install screen iperf olsrd nmap python3

# PIP installation
sudo apt-get install python3-pip

# ROS-Kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-get update
sudo apt-get install ros-kinetic-desktop
sudo rosdep init
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# OpenCV Installation
# Follow this link
https://docs.opencv.org/master/d2/de6/tutorial_py_setup_in_ubuntu.html


# 3. Using Ad-Hoc and OLSRD

# Following method is for both Ubuntu 16.04 and 18.04 (Ubuntu MATE as well)

# Configure wireless interface by adding the following lines to /etc/networks/interfaces. It is a good practice to make a backup of the existing interfaces file.
sudo cp /etc/network/interfaces /etc/networks/interfaces.orig
sudo nano /etc/network/interfaces.mesh

# Write the following lines to interfaces.mesh
source-directory /etc/network/interfaces.d
auto lo
iface lo inet loopback
iface eth0 inet dhcp
auto wlan0
# wlan0 is the name of the wireless interface
iface wlan0 inet static
  address 192.168.19.101
  netmask 255.255.255.0
  wireless-channel 1
  wireless-essid MeshX
  wireless-mode ad-hoc
# Wireless-Mode ad-hoc is supported only by wireless interfaces supporting 802.11 b/g/n/(ac)

# Copy interfaces.mesh to interfaces
cp /etc/network/interfaces.mesh /etc/network/interfaces

# Reboot
sudo reboot now 

# On Reboot, wireless configuration would have changed
# This can be seen through ifconfig and iwconfig
ifconfig
# See the IP Addresscwe have given to the wlan0 interface
iwconfig
# Observe the "Mode:Ad-Hoc" and "Cell"; "Cell" will be same for all the odroids in the Mesh Network
# E-SSID is Mesh-X. With this Ad-Hoc setup is complete.

# OLSRD
# OLSRD is activated by running it as a service from the command line.
# To observe its working, we can run it in debugging mode (-d <0-9>)
# It can be specifically configured through olsrd.conf file in home directory.
sudo olsrd -i wlan0 -d 1
# Runs OLSRD on interface wlan0 in Debug level 1


