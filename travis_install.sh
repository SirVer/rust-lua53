#!/bin/sh

wget http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar -zxf lua-5.3.0.tar.gz
cd lua-5.3.0
sed -i '/MYCFLAGS=/c\MYCFLAGS=-fPIC' src/Makefile
make linux && sudo make install
sudo mkdir -p /usr/lib/i386-linux-gnu/pkgconfig

cat > /usr/lib/i386-linux-gnu/pkgconfig/lua5.3.pc << EOF
V= 5.3
R= 5.3.0
prefix=/usr/local
INSTALL_BIN= \${prefix}/bin
INSTALL_INC= \${prefix}/include/lua-5.3
INSTALL_LIB= \${prefix}/lib
INSTALL_MAN= \${prefix}/share/man/man1
INSTALL_LMOD= \${prefix}/share/lua/\${V}
INSTALL_CMOD= \${prefix}/lib/lua/\${V}
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include/lua-5.3

Name: Lua
Description: An Extensible Extension Language
Version: 5.3.0
Requires:
Libs: -L\${libdir} -llua5.3 -lm
Cflags: -I\${includedir}
EOF


cat /usr/lib/i386-linux-gnu/pkgconfig/lua5.3.pc
