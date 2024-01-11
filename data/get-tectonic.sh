if [ ! -f storage_0.1.tar.gz ]; then
    wget https://ftp.pdl.cmu.edu/pub/datasets/Baleen24/storage_0.1.tar.gz
fi
if [ ! -d tectonic ]; then
    tar xvf storage_0.1.tar.gz
    mv storage tectonic
fi
if [ ! -f results_release.csv.gz ]; then
    wget https://ftp.pdl.cmu.edu/pub/datasets/Baleen24/results_release.csv.gz
fi
if [ ! -f breakdowns.tar.gz ]; then
    wget https://ftp.pdl.cmu.edu/pub/datasets/Baleen24/breakdowns.tar.gz
fi
if [ ! -d breakdown-stats/ ]; then
    tar xvf breakdowns.tar.gz
fi
