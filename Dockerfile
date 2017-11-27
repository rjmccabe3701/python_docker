from python:3.6.3


RUN pip install \
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


RUN pip install \
 jupyter_runner \
 sklearn

ADD scripts/* /scripts/


# EXPOSE 22 6006 8888


