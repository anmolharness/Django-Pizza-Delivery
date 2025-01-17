#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install dependencies for building Python
apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libgdbm-dev \
    libdb5.3-dev \
    libbz2-dev \
    libexpat1-dev \
    liblzma-dev \
    tk-dev \
    libffi-dev \
    wget \
    tzdata \
    && ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Define Python version and source URL
PYTHON_VERSION=<+stage.variables.python>
echo $PYTHON_VERSION
PYTHON_SRC_URL=https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz

# Create a directory for the source code
mkdir -p /usr/src/python
cd /usr/src/python

# Download the Python source code
wget $PYTHON_SRC_URL

# Extract the downloaded tarball
tar -xf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION

# Configure the build
./configure --enable-optimizations

# Compile and install Python
make -j$(nproc)
make altinstall

# Verify the installation
python3.8 --version

# Create a virtual environment named 'venv3'
cd /
python3.8 -m venv /venv3

#install dependencies
source /venv3/bin/activate
pip install --upgrade pip
pip install -r /harness/requirements.txt
deactivate
# Clean up
cd /
rm -rf /usr/src/python

echo "Python 3.8 has been installed successfully."
echo "Virtual environment 'venv3' created successfully."
