#include <jni.h>        // JNI header provided by JDK
#include <iostream>
#include "com_youngstone_jni_HelloWorldJNI.h"   // Generated

JNIEXPORT void JNICALL Java_com_youngstone_jni_HelloWorldJNI_sayHello
  (JNIEnv* env, jobject thisObject) {
    std::cout << "Hello from C++ !!" << std::endl;
}