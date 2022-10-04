FROM python:3.10.7-alpine3.16

# INSTALL CURL:It's Ubuntu's package manager.
# RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

#Alpine
RUN apk add --update curl


WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000


HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \
    CMD curl -fs http://localhost:5000/healthcheck || exit 1

ENTRYPOINT ["python","./src/app.py"]