FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN echo "print('Hello from Jenkins Pipeline')" > app.py

CMD ["python", "app.py"]
