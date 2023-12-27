if [ ! -f storage_0.1.tar.gz ]; then
    wget https://ftp.pdl.cmu.edu/pub/datasets/Baleen24/storage_0.1.tar.gz
fi
if [ ! -d tectonic ]; then
    tar xvf storage_0.1.tar.gz
    mv storage tectonic
fi
