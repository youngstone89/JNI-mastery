#!/usr/bin/env bash

javac -h . HelloJNI.java

gcc -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/darwin" -dynamiclib -o libhello.dylib HelloJNI.c

java -Djava.library.path=. HelloJNI