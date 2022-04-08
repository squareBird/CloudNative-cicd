FROM python
COPY . /usr/src/app
WORKDIR /usr/src/app
CMD ["python3","main.py"]