#! /usr/bin/env bash
cargo install --profile opt --config 'build.rustflags="-C target-cpu=native"'  --path helix-term  --locked
cargo install --path helix-term --locked
mkdir -p  pkg
rsync -a target/release/hx  pkg/
rsync -a --exclude='runtime/grammars/sources' runtime pkg/

