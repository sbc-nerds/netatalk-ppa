#!/bin/bash

debuild -S
dput ppa:sbc-nerds/test-ppa-2 ../*.changes

