#!/bin/bash

echo "root:$ROOT_PASS" | chpasswd
  
exec sshd -D
