FROM python:3.12-rc-slim-bullseye

# Create app directory
WORKDIR /app

# Install app dependencies
COPY src/requirements.txt ./

RUN pip install --index-url https://pypi.tuna.tsinghua.edu.cn/simple/ -r requirements.txt

# Bundle app source
COPY src /app

EXPOSE 8080
CMD [ "python", "server.py" ]