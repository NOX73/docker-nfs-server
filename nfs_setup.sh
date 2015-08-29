#!/bin/bash

set -e

fsid=0
for i in "$@"; do
  mkdir -p $i
  echo "$i *(rw,async,no_root_squash,insecure,fsid=$fsid)" >> /etc/exports
  fsid=$(($fsid + 1))
done

exec runsvdir /etc/sv
