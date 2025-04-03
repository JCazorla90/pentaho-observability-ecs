FROM python:3.10-slim

WORKDIR /app

COPY exporter.py .

RUN pip install prometheus_client

CMD ["python", "exporter.py"]
