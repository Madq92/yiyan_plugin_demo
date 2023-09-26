FROM python:3.12-rc-slim-bullseye

# Create app directory
WORKDIR /app

# Install app dependencies
COPY requirements.txt ./

RUN pip install --index-url https://pypi.tuna.tsinghua.edu.cn/simple/ -r requirements.txt

# Bundle app source
COPY .well-known /app
COPY demo_server.py /app
COPY logo.png /app

EXPOSE 8080
CMD [ "python", "demo_server.py" ]