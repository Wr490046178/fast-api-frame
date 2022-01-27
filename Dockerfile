# 轻量级测试容器
FROM rackspacedot/python38:latest

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get -y install openssh-server vim apt-utils && rm -rf /var/lib/apt/lists/*


WORKDIR /usr/src/app
ENV PYTHONPATH /usr/src/app

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 该用pipenv 管理
RUN pip install pipenv -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com && \
    pipenv install --deploy --system

#COPY requirements.txt /usr/src/app/requirements.txt
#
#RUN pip3 install -i https://pypi.douban.com/simple pip==19.0.1 virtualenv==16.1.0 virtualenv-clone==0.4.0 setuptools==39.0.1
#RUN pip3 install -i https://pypi.douban.com/simple -r requirements.txt

COPY . /usr/src/app

EXPOSE 8001

CMD ["python3", "/usr/src/main.py"]
