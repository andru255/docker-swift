#!/bin/sh -x

# Creating the links
ln -fsn ../run-container.sh run-container.sh
ln -fsn ../compile-swift-file.sh compile-swift-file.sh
ln -fsn ../run-compiled-file.sh run-compiled-file.sh

# start compilation
./compile-swift-file.sh test.swift -o compiled-test

# run the compiled file
./run-compiled-file.sh ./compiled-test

# deleting the links
rm -fr run-container.sh
rm -fr compile-swift-file.sh
rm -fr run-compiled-file.sh

# deleting the compiled file
rm -fr compiled-test 
