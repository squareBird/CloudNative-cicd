<H1>Cloud Native Study CI/CD</H1>

목표 
1. `python` 어플리케이션을 `Github Action`을 이용해 `Docker` 이미지로 Build
2. 해당 이미지를 Private 저장소인 `Harbor`에 push
3. 인증을 위해 `self-hosted runner` 사용

도구 : `Github Action`, `Docker`, `Harbor`, `self-hosted runner`

```bash
# self-hosted runner 실행용 계정 생성
# sudo 권한으로 실행 불가
$ adduser cicd

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