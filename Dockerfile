FROM python
COPY . .
CMD ["test.py"]
ENTRYPOINT ["python3"]