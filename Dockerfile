FROM python:3.11.5-alpine3.17

# Create app directory
WORKDIR /app

# Install app dependencies
COPY src/requirements.txt ./

RUN pip install --index-url https://pypi.tuna.tsinghua.edu.cn/simple/ -r requirements.txt

# Bundle app source
COPY src /app

EXPOSE 8080
CMD [ "python", "server.py" ]