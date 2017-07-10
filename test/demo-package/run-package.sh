#!/bin/sh -x

cp -fr ../template-package/Sources/main.swift Sources/main.swift
cp -fr ../template-package/Sources/app.swift Sources/app.swift

# lets building
./run-container.sh swift build

# test building
./run-container.sh .build/debug/app


