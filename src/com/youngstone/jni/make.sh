#!/usr/bin/env bash

# Now, we need to create the implementation of our native method in C++.
# Within C++ the definition and the implementation are usually stored in .h and .cpp files respectively.
# First, to create the definition of the method, we have to use the -h flag of the Java compiler:
javac -h . HelloWorldJNI.java

# At this point, we have all parts we need in place and have a connection between them.
# We need to build our shared library from the C++ code and run it!
# To do so, we have to use G++ compiler, not forgetting to include the JNI headers from our Java JDK installation.
# macOS
g++ -c -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/darwin com_youngstone_jni_HelloWorldJNI.cpp -o com_youngstone_jni_HelloWorldJNI.o

# Once we have the code compiled for our platform into the file com_baeldung_jni_HelloWorldJNI.o, we have to include it in a new shared library. Whatever we decide to name it is the argument passed into the method System.loadLibrary.
# We named ours “native”, and we'll load it when running our Java code.
# The G++ linker then links the C++ object files into our bridged library.
g++ -dynamiclib -o libnative.dylib com_youngstone_jni_HelloWorldJNI.o -lc


# we need to add the full path to the directory containing the library we've just generated. This way Java will know where to look for our native libs:
# run this command in src directory 
java -cp . -Djava.library.path=/Users/yeongseokkim/Workspace/JNI-mastery/src/com/youngstone/jni com.youngstone.jni.HelloWorldJNI
