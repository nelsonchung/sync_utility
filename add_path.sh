#!/bin/bash

export PATH="${PATH}:$1"
echo "export PATH=\"\${PATH}:$1\"" >> ~/.bashrc
