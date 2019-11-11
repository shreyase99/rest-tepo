 #! /bin/bash
 #1: Installation of dependencies
 sudo apt-get install gcc g++ python
 sudo apt-get install gcc g++ python python-dev
 sudo apt-get install mercurial python-setuptools git
 sudo apt-get install qt5-default
 #python-pygoocanvas not needed for 18.04
 sudo apt-get install python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev ipython
 sudo apt-get install gir1.2-goocanvas-2.0 python-gi python-gi-cairo python-pygraphviz python3-gi python3-gi-cairo python3-pygraphviz gir1.2-gtk-3.0 ipython ipython3  
 sudo apt-get install openmpi-bin openmpi-common openmpi-doc libopenmpi-dev
 sudo apt-get install autoconf cvs bzr unrar
 sudo apt-get install gdb valgrind
 sudo apt-get install doxygen graphviz imagemagick
 sudo apt-get install texlive texlive-extra-utils texlive-latex-extra texlive-font-utils texlive-lang-portuguese dvipng latexmk
 sudo apt-get install python-sphinx dia 
 sudo apt-get install gsl-bin libgsl2 libgsl-dev
 sudo apt-get install flex bison libfl-dev
 sudo apt-get install tcpdump
 sudo apt-get install sqlite sqlite3 libsqlite3-dev
 sudo apt-get install libxml2 libxml2-dev
 sudo apt-get install cmake libc6-dev libc6-dev-i386 libclang-dev llvm-dev automake
 #Yes, this needs Python 2
 sudo pip install cxxfilt
 sudo apt-get install libgtk2.0-0 libgtk2.0-dev
 sudo apt-get install vtun lxc
 sudo apt-get install libboost-signals-dev libboost-filesystem-dev

 #2: Installation of ns-3 in Home Folder
 cd ~
 mkdir ns3
 cd ns3
 wget https://www.nsnam.org/releases/ns-allinone-3.29.tar.bz2
 tar xjf ns-allinone-3.29.tar.bz2
 cd ns-allinone-3.29
 ls

 #Build
 ./build.py --enable-examples --enable-tests

 #Waf-Build
 cd ~/ns3/ns-allinone-3.29/ns-3.29
 ./waf -d debug --enable-examples --enable-tests configure

 #Testing
./test.py

