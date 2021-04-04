package com.reactnativeturbomodulesample

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class TurboModuleSampleModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "TurboModuleSample"
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {
    
      promise.resolve(nativeMultiply(a, b));
    
    }

    
    external fun nativeMultiply(a: Int, b: Int): Int;

    companion object
    {

        // Used to load the 'native-lib' library on application startup.
        init
        {
            System.loadLibrary("cpp")
        }
    }
    
}
