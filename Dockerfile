FROM carsurta/qgis-novnc:xdummy

# noVNC 설치
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc \
    && git clone https://github.com/novnc/websockify /opt/novnc/utils/websockify \
    && ln -s /opt/novnc/vnc.html /opt/novnc/index.html

# Xdummy 설정 파일 복사
COPY xorg.conf /etc/X11/xorg.conf

# Fluxbox 설정 파일 복사
COPY fluxbox/apps /root/.fluxbox/apps

# Supervisor 설정 복사
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# 시작 스크립트 복사
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 포트 노출
EXPOSE 5900 6080

# 컨테이너 시작 시 실행될 명령어
CMD ["/start.sh"]