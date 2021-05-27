package com.example.reactnativeturbomodulesample;

import android.util.Log;

import com.facebook.react.bridge.ReactContext;
import com.facebook.react.turbomodule.core.CallInvokerHolderImpl;
import com.facebook.react.turbomodule.core.interfaces.TurboModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.reactnativeturbomodulesample.MySampleTurboModule;

public class MyHybrid {
    static {
        System.loadLibrary("example_reactnativeturbomodulesample_modules");
    }

    public void setup(ReactContext context) {
        CallInvokerHolderImpl jsCallInvokerHolder = (CallInvokerHolderImpl)context.getCatalystInstance().getJSCallInvokerHolder();
        CallInvokerHolderImpl nativeCallInvokerHolder = (CallInvokerHolderImpl)context.getCatalystInstance().getNativeCallInvokerHolder();
        long contextPointer = context.getJavaScriptContextHolder().get();

        // TODO: what's args
        MySampleTurboModule module = new MySampleTurboModule((ReactApplicationContext) context);

        initHybrid(
            contextPointer,
            jsCallInvokerHolder,
            nativeCallInvokerHolder,
            module);
    }

  public native void initHybrid(long jsContextNativePointer, CallInvokerHolderImpl jsCallInvokerHolder, CallInvokerHolderImpl nativeCallInvokerHolder, TurboModule module);
}
