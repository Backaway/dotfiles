#! /bin/bash

# for svn diff: 修改~/.subversion/config，找到如下配置行：
# diff-cmd = diff_program (diff, gdiff, etc.)
# diff-cmd = ~/bin/diffwrap.sh

# 参数大于5时，去掉前5个参数；参数小于5，失败，什么也不做
shift 5

# 使用vimdiff比较
vimdiff "$@"
