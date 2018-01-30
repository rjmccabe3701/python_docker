FROM eisgit.rockwellcollins.com:4567/ace-ml/docker:rc_proxy AS proxy

from python:3.6.4

#To set at build time do:
# docker build --build-arg proxy=<some other proxy> ....
ARG proxy=${variable:-"http://proxy.rockwellcollins.com:9090"}
ENV http_proxy=${proxy}
ENV ftp_proxy=${proxy}

COPY --from=proxy /install_proxy /install_proxy
RUN /install_proxy -c -i


RUN pip install --proxy=$http_proxy \
   ipython \
   matplotlib \
   numpy \
   pandas \
   scipy \
   tensorflow

RUN apt-get update && apt-get install -y \
   openssh-server \
   vim

RUN sed -i 's/\(UsePAM\).*/\1 no/' /etc/ssh/sshd_config && \
   sed -i 's/\(PermitRootLogin\).*/\1 yes/' /etc/ssh/sshd_config


RUN pip install --proxy=$http_proxy \
 jupyter_runner \
 sklearn \
 sqlalchemy \
 psycopg2

ADD scripts/* /scripts/


# EXPOSE 22 6006 8888


