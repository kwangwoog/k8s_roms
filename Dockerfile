# Install ubuntu
FROM 		ubuntu:18.04
MAINTAINER	next7885@snu.ac.kr
RUN		apt-get -y update
RUN		apt-get install -y openssh-server

#replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#make .ssh
RUN mkdir /root/.ssh
RUN mkdir -p /var/run/sshd
# Install gcc
 RUN apt-get -y install apt-utils
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install gcc
RUN apt-get -y install g++
RUN apt-get -y install gfortran
RUN apt-get -y install wget
RUN apt-get -y install file
RUN wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.4.tar.gz
RUN tar -xvf ./openmpi-3.1.4.tar.gz
RUN export CC=gcc
RUN export CXX=g++
RUN export FC=gfortran
RUN export PATH=$PATH:/usr/bin:/usr/local/mpi/bin
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/lib64:/usr/local/mpi/lib
WORKDIR /openmpi-3.1.4
RUN apt-get -y install make
RUN ./configure --prefix=/usr/local/mpi
RUN make
RUN make install
RUN apt-get -y install git
RUN apt-get -y install iputils-ping
RUN apt-get -y install net-tools
RUN wget https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-c-4.7.1.tar.gz
RUN wget https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-fortran-4.5.1.tar.gz
RUN wget http://www.zlib.net/zlib-1.2.11.tar.gz
RUN wget https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.5.tar.gz
RUN tar -xvf ./hdf5-1.10.5.tar.gz
RUN tar -xvf ./zlib-1.2.11.tar.gz
WORKDIR /openmpi-3.1.4/zlib-1.2.11
RUN ./configure --prefix=/usr/local/zlib
RUN make clean
RUN make && make install
RUN export PATH=$PATH:/usr/local/mpi/bin
WORKDIR /openmpi-3.1.4/hdf5-1.10.5
RUN export CC=mpicc CPPFLAGS=-I/usr/local/hdf5/include LDFLAGS=-L/usr/local/hdf5/lib 
RUN ./configure --prefix=/usr/local/hdf5 --with-zlib=/usr/local/zlib --enable-hl
RUN make clean
RUN make && make install
WORKDIR /openmpi-3.1.4
RUN tar -xvf ./netcdf-c-4.7.1.tar.gz
RUN tar -xvf ./netcdf-fortran-4.5.1.tar.gz

WORKDIR /openmpi-3.1.4/netcdf-c-4.7.1
RUN apt-get -y install vim
RUN apt-get -y install m4
RUN apt-get -y install curl
COPY compile_netcdf.sh /openmpi-3.1.4/netcdf-c-4.7.1/.
RUN ./compile_netcdf.sh
RUN make install
RUN /usr/local/netcdf/bin/nc-config --has-hdf5
WORKDIR /openmpi-3.1.4/netcdf-fortran-4.5.1
COPY compile_netcdf_fortran.sh /openmpi-3.1.4/netcdf-fortran-4.5.1/.
RUN ./compile_netcdf_fortran.sh
WORKDIR /root
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY initial_profile.sh /root/.
RUN ./initial_profile.sh
RUN adduser roms --disabled-password
USER roms
ENV username next7885
#ENV username git
ENV password sja1974!
#ENV password gitgit
WORKDIR /home/roms
COPY roms_profile.sh /home/roms/.
RUN ./roms_profile.sh
RUN mkdir roms_acc
#RUN git clone https://$username:$password@www.myroms.org/git/src ./roms_acc
RUN git clone https://$username:$password@github.com/kwangwoog/k8s_roms.git ./roms_acc
RUN cp -R /home/roms/roms_acc/roms_acc /home/roms/.
RUN rm /home/roms/roms_acc/makefile
COPY makefile /home/roms/roms_acc/.
RUN rm /home/roms/roms_acc/Compilers/Linux-gfortran.mk
COPY Linux-gfortran.mk /home/roms/roms_acc/Compilers/.
WORKDIR /home/roms/roms_acc
USER root
RUN chown roms /home/roms/roms_acc/makefile
USER roms
#RUN /home/roms/roms_profile.sh
WORKDIR /home/roms/roms_acc
RUN make clean
RUN export PATH=$PATH:/usr/local/mpi/bin && make 
# add credentials on build
#ARG SSH_KEY
#RUN mkdir /root/.ssh
#RUN echo $SSH_KEY > /root/.ssh/id_rsa
#COPY id_rsa /root/.ssh/id_rsa
#COPY id_rsa.pub /root/.ssh/id_rsa.pub
# make sure domain accept
#RUN touch /root/.ssh/known_hosts
#RUN ssh-keyscan 147.46.32.250 >> /root/.ssh/known_hosts
#RUN echo "StrictHostKeyChecking no " > /root/.ssh/config
#RUN chmod 600 /root/.ssh/id_rsa
#RUN git clone ssh://$username:$password@147.46.32.250/home/git/repo/roms_acc.git ./roms_src
USER root
RUN whoami
