# Artifact for Baleen (FAST 2024)

_Paper: [Baleen: ML Admission & Prefetching for Flash Caches](https://wonglkd.fi-de.net/papers/Baleen-FAST24.pdf)_

This repository is targeted at those seeking to reproduce the results found in the Baleen paper and contains a frozen copy of the code.
If you are looking to use Baleen, please go to https://github.com/wonglkd/BCacheSim/ for the latest version.

**Scope:** this repository contains Python code to reproduce the **simulator** results in the Baleen paper. The testbed code modified a proprietary internal version of CacheLib and will not be released at this time, pending a rebase on the open-source version of CacheLib. Another key difference is that Meta's exact constants for the disk head time function will not be released, meaning that results will not be exactly the same; instead, we use constants (seek time and bandwidth) measured on the hard disks in our university testbed.

**Nomenclature:**
Some terms were renamed after coding for better clarity in the paper. However, they mean the same thing.

- Service Time (in the code) was renamed to Disk Head Time (in the paper)
- Chunks (in the code) are called segments (in the paper)

## Getting Started

_Time estimate: 60 mins (20 mins interactive)._

### Installation (Chameleon Trovi)

The recommended way is to use Chameleon Trovi, an academic cloud. Time estimate: 30 minutes (mostly waiting time).

1. Launch artifact on Trovi [Link]
2. Run supplied notebook, which will provision a beefier node (reserved for up to 7 days) that you can create a SSH tunnel to.

### Installation (local computer)

Alternatively, you may do a manual install:

1. Clone the repository (if not already done)

```
git clone --recurse-submodules https://github.com/wonglkd/Baleen-FAST24.git
cd Baleen-FAST24
```

2. Install Python dependencies with Conda or pip.

```
conda env create -f BCacheSim/install/env_cachelib-py-3.11.yaml
conda env create -f BCacheSim/install/env_cachelib-pypy-3.8.yaml
```

3. Download trace files (see [here](https://ftp.pdl.cmu.edu/pub/datasets/Baleen24/) for more details on the traces)

```
cd data
bash get-tectonic.sh
```

### Do a simple experiment

1. Manually run the simulator with the baseline RejectX. (4 mins)

```
./BCacheSim/run_py.sh py -B -m BCacheSim.cachesim.simulate_ap --config runs/example/rejectx/config.json
```

2. Manually train Baleen's ML models (25 secs) and run the simulator with Baleen (~30 mins).

```
./BCacheSim/run_py.sh py -B -m BCacheSim.episodic_analysis.train --exp example --policy PolicyUtilityServiceTimeSize2 --region Region1 --sample-ratio 0.1 --sample-start 0 --trace-group 201910 --supplied-ea physical --target-wrs 34 50 100 75 20 10 60 90 30 --target-csizes 366.475 --output-base-dir runs/example/baleen --eviction-age 5892.856 --rl-init-kwargs filter_=prefetch --train-target-wr 35.599 --train-models admit prefetch --train-split-secs-start 0 --train-split-secs-end 86400 --ap-acc-cutoff 15 --ap-feat-subset meta+block+chunk
./BCacheSim/run_py.sh py -B -m BCacheSim.cachesim.simulate_ap --config runs/example/baleen/prefetch_ml-on-partial-hit/config.json
```

3. Use `notebooks/example.ipynb` to view and plot results.


## Detailed Instructions

_Time estimate: XX mins._

_Time estimate (interactive): XX mins._

This section assumes you have completed the 'Getting Started' section and have
installed the code and downloaded the traces.

Roadmap for evaluation:
- Run Baleen
- Test

Jupyter notebooks:


## Directory structure

- data: traces that are used as input
- runs: where experiment results are stored
- tmp: temporary directory for ML models, generated episode files
- notebooks: Jupyter notebooks for experiemnts
- notebooks/figs: Output directory for figures


## Additional notes

Time required to re-run all simulator runs: 624 machine-days
7 traces
10 samples
