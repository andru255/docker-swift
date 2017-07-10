#!/bin/sh -x

# create the folder target
./clean-package.sh
mkdir hello-world-package && cd hello-world-package

# Creating the links
ln -fsn ../../run-container.sh run-container.sh
ln -fsn ../../compile-swift-file.sh compile-swift-file.sh
ln -fsn ../../run-compiled-file.sh run-compiled-file.sh

# create empty package
./run-container.sh swift package init

# run test
../run-package.sh

# deleting the links
rm -fr run-container.sh
rm -fr compile-swift-file.sh
rm -fr run-compiled-file.sh

cd ..
