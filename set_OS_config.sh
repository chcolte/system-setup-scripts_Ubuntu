#! /bin/bash
@echo off

read -p "set OS config"

echo "ハードウェア時刻をローカル時刻に変更(Windowsと共存)"
timedatectl set-local-rtc 1
