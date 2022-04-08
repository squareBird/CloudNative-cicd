FROM python
WORKDIR /usr/src/app
COPY . .
CMD ["test.py"]
ENTRYPOINT ["python3"]