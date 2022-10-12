#!/bin/sh

echo "tar $1"

cudnn_name=$1
sudo tar -zxvf $1

cuda_version=${cudnn_name:6:4}
cuda_path=/usr/local/cuda-${cuda_version}
echo "cp to cuda"
if [ -d ${cuda_path} ]
then
    cp cuda/lib64/* ${cuda_path}/lib64/
    cp cuda/include/* ${cuda_path}/include/
else
    echo "not ${cuda_path}"
fi
echo 'CUDNN VERSION'
cat ${cuda_path}/include/cudnn_version.h | grep CUDNN_MAJOR -A 2

sudo rm -rf cuda
