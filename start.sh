#!/bin/bash

# Xdummy (Xorg) 서버 시작
Xorg -noreset +extension GLX +extension RANDR +extension RENDER -logfile /tmp/Xorg.log -config /etc/X11/xorg.conf :1 &

# 그래픽 소프트웨어 랜더링 강제
export LIBGL_ALWAYS_SOFTWARE=1

# 디스플레이 설정
export DISPLAY=:1

# Fluxbox 윈도우 매니저 시작
fluxbox &

# Fluxbox가 완전히 시작될 때까지 대기
sleep 2

# QGIS 실행
DISPLAY=:1 qgis --nologo &

# VNC 서버 시작
x11vnc -display :1 -nopw -forever &

# noVNC 서버 시작
/opt/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6080
