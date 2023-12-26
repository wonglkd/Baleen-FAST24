# Artifact for Baleen (FAST 2024)

_Paper: [Baleen: ML Admission & Prefetching for Flash Caches](https://wonglkd.fi-de.net/papers/Baleen-FAST24.pdf)_

This repository is targeted at those seeking to reproduce the results found in the Baleen paper and contains a frozen copy of the code.
If you are looking to use Baleen, please go to https://github.com/wonglkd/BCacheSim/ for the latest version.

**Scope:** this repository contains Python code to reproduce the **simulator** results in the Baleen paper. The testbed code modified a proprietary internal version of CacheLib and will not be released at this time, pending a rebase on the open-source version of CacheLib. Another key difference is that Meta's exact constants for the disk head time function will not be released, meaning that results will not be exactly the same; instead, we use constants (seek time and bandwidth) measured on the hard disks in our university testbed.

## Getting Started

_Time estimate: XX mins._

### Installation

The easiest way is to use Chameleon Trovi, where we have prepared a package with all the installed dependencies and data.

[Link]

Alternatively, you may do a manual install:

1. Clone the repository (if not already done)

```
git clone --recurse-submodules git@github.com:wonglkd/Baleen-FAST24.git
git submodule init
git submodule update
cd Baleen-FAST24
```

2. Install Python dependencies with Conda

```
conda env create -f BCacheSim/install/env_cachelib-py-3.11.yaml
conda env create -f BCacheSim/install/env_cachelib-pypy-3.8.yaml
```

3. Download trace files

```
cd data
bash get-tectonic.sh
```

### Do a simple experiment

1. Run the simulator with the baseline RejectX. (X mins)

```
cd BCacheSim
./run_py.sh cachesim.simulate_ap --config ...
```

2. Open the Jupyter notebook and run a experiment. (X mins)



## Detailed Instructions

_Time estimate (running): XX mins._

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
- tmp: temporary directory for ML models, generated episode files: may be deleted
- notebooks: Jupyter notebooks for experiemnts
- notebooks/figs: Output directory for figures

