export PATH=$PATH:/usr/local/mpi/bin

CC=mpicc CXX=mpic++ CPPFLAGS="-I/usr/local/hdf5/include -I/usr/local/netcdf/include" LDFLAGS="-L/usr/local/netcdf/lib -L/usr/local/hdf5/lib -L/usr/local/zlib/lib" ./configure --prefix=/usr/local/netcdf --disable-dap

make clean

make && make install
