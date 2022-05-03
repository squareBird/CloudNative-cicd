<H1>Cloud Native Study CI/CD</H1>

목표 
1. `python` 어플리케이션을 `Github Action`을 이용해 `Docker` 이미지로 Build
2. 해당 이미지를 Private 저장소인 `Harbor`에 push
3. 인증을 위해 `self-hosted runner` 사용

도구 : `Github Action`, `Docker`, `Harbor`, `self-hosted runner`

<h2>self-hosted runner 설정</h2>

```bash
# self-hosted runner 실행용 계정 생성
# sudo 권한으로 실행 불가
$ adduser cicd
```

# 설치파일 다운로드
$ mkdir actions-runner && cd actions-runner# Download the latest runner package
$ curl -o actions-runner-linux-x64-2.289.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.289.2/actions-runner-linux-x64-2.289.2.tar.gz# Optional: Validate the hash
$ echo "7ba89bb75397896a76e98197633c087a9499d4c1db7603f21910e135b0d0a238  actions-runner-linux-x64-2.289.2.tar.gz" | shasum -a 256 -c# Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.289.2.tar.gz

# 설치 및 설정
./config.sh --url https://github.com/squareBird/CloudNative-cicd --token ANL7BN3LUCFPI3JE5FCLL7LCJ7PL6

# job 대기상태 돌입
$ ./run.sh

# 사용방법
# github action에 self-hosted 설정
$ runs-on: self-hosted
```

<h2>Harbor Docker 인증서 추가</h2>
`Harbor`는 Private Repository이며 `Harbor`의 이미지를 `pull` 또는 `push`하기 위해서는 인증 절차가 필요

`self-hosted runner` 서버에 `Harbor 인증서`를 추가하여 권한 부여.


<h4>먼저 Harbor가 설치된 서버에서 self-hosted runner 서버로 인증서 전송</h4>
```bash
# Harbor가 설치된 서버의 인증서 확인
$ Harbor-server# ls
ca.crt  server.cert  server.key

$ Harbor-server# scp * root@{self-hosted runner 서버 IP}:/docker/etc/certs.d/{Harbor 서버 IP}/ 
```


<h4>self-hosted server의 Docker 재기동하여 인증서 적용</h4>
```bash
# 도커 재시작
$ self-hosted-runner# systemctl restart docker
```
