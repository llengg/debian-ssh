#!/bin/bash

  echo "root:$ROOT_PASS" | chpasswd
  
exec /usr/sin/sshd -D
