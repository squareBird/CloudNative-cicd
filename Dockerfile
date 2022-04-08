FROM python
COPY . .
CMD ["python3","test.py"]