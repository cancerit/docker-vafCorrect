FROM  ubuntu:16.04
MAINTAINER Shriram Bhosle <sb43@sanger.ac.uk>
LABEL uk.ac.sanger.cgp="Cancer,Ageing and Somatic Mutations Group, Wellcome Trust Sanger Institute" \
      version="0.0.1" \
      description="The vafCorrect for dockstore.org"
# make non interactive fronend 
USER  root

ENV OPT /opt/wtsi-cgp PATH $OPT/bin:$PATH PERL5LIB $OPT/lib/perl5 DEBIAN_FRONTEND=noninteractive LANG=en_UK.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_UK.UTF-8

## USER CONFIGURATION
RUN adduser --disabled-password --gecos '' ubuntu && chsh -s /bin/bash && mkdir -p /home/ubuntu

RUN mkdir -p $OPT/bin

COPY build/apt-build.sh build/
RUN ["bash", "build/apt-build.sh"]

#COPY build/perllib-build.sh build/
#RUN ["bash", "build/perllib-build.sh"]

COPY build/opt-build.sh build/
RUN ["bash", "build/opt-build.sh"]

USER    ubuntu
WORKDIR /home/ubuntu

CMD ["/bin/bash"]

