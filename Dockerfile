FROM centos:7

RUN yum update -y
RUN yum install -y python3
RUN curl -o oracle_instant_client.rpm https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm
RUN chmod 777 oracle_instant_client.rpm
RUN yum install -y oracle_instant_client.rpm

ENV VIRTUAL_ENV "/opt/venv"
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN yum install -y xorg-x11-server-Xvfb
RUN curl -O https://download-installer.cdn.mozilla.net/pub/firefox/releases/60.8.0esr/linux-x86_64/en-US/firefox-60.8.0esr.tar.bz2
RUN yum install -y bzip2
RUN tar -jvxf firefox-60.8.0esr.tar.bz2 -C /usr/local/
RUN ln -s /usr/local/firefox/firefox /usr/bin/firefox
RUN yum install -y gtk3

ADD https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm /root/google-chrome-stable_current_x86_64.rpm
RUN yum -y install /root/google-chrome-stable_current_x86_64.rpm

#WORKDIR $CI_PROJECT_DIR
#source env/bin/activate

RUN yum -y install java-1.8.0-openjdk
ENV JAVA_HOME "/usr/lib/jvm/jre"
ENV PATH "$JAVA_HOME/bin:$PATH"

RUN yum -y install epel-release
RUN yum -y install npm nodejs
RUN npm install -g allure-commandline --save-dev
RUN yum install -y openssh-clients openssh
RUN yum install -y git

#RUN yum install -y xvfb
RUN pip install --upgrade pip
RUN pip3 install setuptools-rust
RUN pip3 install wheel
RUN pip3 install selenium
RUN pip3 install ddt
RUN pip3 install pytest-docker
RUN pip3 install cx_Oracle --upgrade
RUN pip3 install pytest-html
RUN pip3 install allure-pytest
RUN pip3 install pytest-jira
RUN pip3 install scp
RUN pip3 install paramiko
RUN pip3 install config
RUN pip3 install scipy
RUN pip3 install urllib3

COPY . /usr/bin