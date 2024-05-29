#!/bin/bash -ex

# Install necessary dependencies
minimal_apt_get_install libssl-dev libffi-dev libdb-dev libgdbm-dev build-essential

# Create temporary directories
TEMP_DIR=`mktemp -d -t python_XXXXXXXXXX`
TARBALL_TEMP=`mktemp -t python.tar.gz.XXXXXXXXXX`
VERSION=3.8.13
URL="http://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz"

# Download Python tarball
curl -L -o "$TARBALL_TEMP" "$URL"
tar -zxvf $TARBALL_TEMP --strip-components=1 -C $TEMP_DIR
cd $TEMP_DIR

# Create installation directory
mkdir /python3

# Configure, build, and install Python
AR="x86_64-linux-gnu-gcc-ar" RANLIB="x86_64-linux-gnu-gcc-ranlib" \
CFLAGS="-g -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -specs=/usr/share/dpkg/no-pie-compile.specs -fstack-protector -Wformat -Werror=format-security" \
CPPFLAGS="-Wdate-time -D_FORTIFY_SOURCE=2" \
LDFLAGS="-Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -specs=/usr/share/dpkg/no-pie-link.specs -Wl,-z,relro -g -fwrapv -O3 -flto -fuse-linker-plugin -ffat-lto-objects" \
./configure --prefix=/python3 --enable-optimizations \
    --enable-ipv6 --enable-loadable-sqlite-extensions --with-dbmliborder=bdb:gdbm --with-computed-gotos --with-system-expat --with-system-ffi
make
make install
/python3/bin/pip3 --version

# Clean up temporary files
rm -r $TEMP_DIR
rm $TARBALL_TEMP*

# Create a virtual environment named 'venv3'
/python3/bin/python3.8 -m venv /appenv/src/venv3

# Activate the virtual environment and install requirements
source /appenv/src/venv3/bin/activate
pip install --upgrade pip
pip install -r /appenv/src/requirements.txt
deactivate

echo "Python 3.8 has been installed successfully."
echo "Virtual environment 'venv3' created and requirements installed successfully."
