#!/bin/sh
grep \"bytecode\" build/contracts/* | awk '{print $1 " " length($3)/2}'
