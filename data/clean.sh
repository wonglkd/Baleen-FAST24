#!/bin/bash
cd "$(dirname "$0")"
rm results_release.csv.gz || true
rm -r tectonic || true
rm -r breakdown-stats/ || true
rm breakdowns.tar.gz || true
rm storage_0.1.tar.gz || true
