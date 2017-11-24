FROM java
RUN yum update && \
    yum upgrade -y && \
    yum install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    yum update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    yum install -y oracle-java8-installer && \
    yum clean
RUN yum install -y git
ENV MAVEN_VERSION 3.3.9

RUN yum install curl
RUN mkdir -p /usr/share/maven \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

VOLUME /root/.m2
