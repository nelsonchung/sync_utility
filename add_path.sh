#!/bin/bash

#請使用source add_path.sh path1的方式來執行，path才會立即生效
export PATH="${PATH}:$1"
echo "export PATH=\"\${PATH}:$1\"" >> ~/.bashrc
