#!/usr/bin/env bash

set -eu

export DEBIAN_FRONTEND=noninteractive

dist=${1:-$(lsb_release -cs)}
