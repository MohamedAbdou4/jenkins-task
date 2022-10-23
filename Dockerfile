# in this image we will add docker client
FROM jenkins/ssh-agent
USER root

# install docker client
RUN apt update
RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update
RUN apt-cache policy docker-ce
RUN apt install -y docker-ce
RUN usermod -aG docker jenkins


#this is docker image from jenkins ssh with docker client
