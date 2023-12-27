if [ ! -d "BCacheSim" ]; then
  echo "BCacheSim does not exist; are you in the correct directory? (Baleen-FAST24)"
  exit 1
fi

# We assume the repository has already been cloned; if not, run the line below:
# git clone --recurse-submodules https://github.com/wonglkd/Baleen-FAST24.git

cd Baleen-FAST24
git pull --recurse-submodules

# Install dependencies (Conda)
conda env create -f BCacheSim/install/env_cachelib-py-3.11.yaml
# Pypy is optional; used to speed up non-ML simulations
# conda env create -f BCacheSim/install/env_cachelib-pypy-3.8.yaml
conda activate cachelib-py-3.11

# Install dependencies (pip) - alternative to Conda
# python3 -m pip install -r BCacheSim/install/requirements.txt --user

# Download trace files
cd data
bash get-tectonic.sh
cd ..

# Run RejectX (4 mins)
./BCacheSim/run_py.sh py -B -m BCacheSim.cachesim.simulate_ap --config runs/example/rejectx/config.json

# Train Baleen (1 min)
./BCacheSim/run_py.sh py -B -m BCacheSim.episodic_analysis.train --exp example --policy PolicyUtilityServiceTimeSize2 --region Region1 --sample-ratio 0.1 --sample-start 0 --trace-group 201910 --supplied-ea physical --target-wrs 34 50 100 75 20 10 60 90 30 --target-csizes 366.475 --output-base-dir runs/example/baleen --eviction-age 5892.856 --rl-init-kwargs filter_=prefetch --train-target-wr 35.599 --train-models admit prefetch --train-split-secs-start 0 --train-split-secs-end 86400 --ap-acc-cutoff 15 --ap-feat-subset meta+block+chunk

# Run Baleen (30 mins)
./BCacheSim/run_py.sh py -B -m BCacheSim.cachesim.simulate_ap --config runs/example/baleen/prefetch_ml-on-partial-hit/config.json

# To examine the results, run Baleen-FAST24/notebooks/example/example.ipynb
