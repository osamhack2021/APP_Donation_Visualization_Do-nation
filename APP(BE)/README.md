## 서버 구동방법

EC2 인스턴스 상에서 서버를 구동하는 방법을 기준으로 설명합니다.

### Docker 설치

---

```bash
$ sudo apt install docker.io
$ sudo usermod -aG docker ubuntu
$ sudo service docker start
$ sudo chmod 666 /var/run/docker.sock
```

### MySQL DB 실행

---

Dockerfile이 있는 폴더에서 명령어를 실행합니다.

```bash
docker build --tag mysqldb .
docker run --name=mysql-db -d -p 3306:3306 mysqldb  --character-set-server=utf8 --collation-server=utf8_general_ci --default-authentication-plugin=mysql_native_password
```

### Express 서버 실행

---

APP(BE)/server 폴더 내에서 명령어를 실행합니다.

```bash
$ npm install
$ npm run build
$ npm start
```

백엔드 개발시에는 npm start 대신 dev 명령어를 실행할 수 있습니다.
이 경우 코드 변경시 nodemon을 통해 자동으로 서버를 재가동 합니다.

```bash
$ npm install
$ npm run dev
```

백그라운드에서 서버를 구동시키고 싶다면 pm2를 이용합니다.

```bash
$ npm install -g pm2
$ pm2 start npm -- start
```

## 포트 사용

### 포트 포워딩

8000번 포트가 아닌 HTTP, HTTPS 기본 포트를 사용하기 위해 port forwarding을 진행할 수 있습니다.

```bash
$ iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8000
$ iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8000
$ service iptables save
```

### 방화벽 개방

EC2 사용시 기본 보안그룹에 ssh 22번 포트를 제외하고는 모두 차단돼있습니다.  
필요한 포트를 인바운드 그룹에 추가해야 사용할 수 있습니다.

- 80, 443: 포트 포워딩을 진행한 경우 해당 포트를 허용합니다.
- 3306: 외부 클라이언트를 통해 MySQL DB에 접근하고자 하는 경우 허용합니다. (개발 단계에서만 허용)
- 8000: 포트 포워딩을 진행하지 않은 경우 express가 사용하는 포트를 허용합니다.
