# QGIS-NOVNC

## 개요
웹브라우저에서 원격으로 접속해 qgis를 활용할 수 있게 하는 도커 컨테이너입니다. qgis와 vnc, novnc를 조합했습니다.

## 도커 이미지 구성
이 레포를 clone한 후 바로 이미지를 빌드하면 됩니다.
```
git clone https://github.com/carsurta/qgis-novnc.git
docker build -t qgis-novnc .
```

## 실행방법
컨테이너의 6080포트에 접근하면 qgis 기능을 활용할 수 있습니다.
```
docker run -d -p 6080:6080 qgis-novnc
```
실행 후 웹브라우저에서 http://localhost:6080 접속

아직 포트 설정 등의 기능을 넣지는 않았습니다.
