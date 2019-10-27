export PATH=$PATH:/usr/local/mpi/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/netcdf/lib
ldconfig -p
CC=mpicc FC=mpif90 CXX=mpic++ CFLAGS=-DgFotran CPPFLAGS="-I/usr/local/hdf5/include -I/usr/local/netcdf/include -fPIC" LDFLAGS="-L/usr/local/netcdf/lib -L/usr/local/hdf5/lib -L/usr/local/zlib/lib" ./configure --disable-shared --prefix=/usr/local/netcdf

make clean

make && make install
