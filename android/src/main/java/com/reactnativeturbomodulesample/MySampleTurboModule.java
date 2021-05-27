package com.reactnativeturbomodulesample;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;
import com.facebook.react.bridge.WritableNativeMap;
import com.facebook.react.module.annotations.ReactModule;
import com.facebook.fbreact.specs.MySampleTurboModuleSpec;

/**
 * Module that monitors and provides information about the state of Touch Exploration service on the
 * device. For API >= 19.
 */
@ReactModule(name = MySampleTurboModule.NAME)
public class MySampleTurboModule extends MySampleTurboModuleSpec {

  public static final String NAME = "MySampleTurboModule";

  public MySampleTurboModule(ReactApplicationContext context) {
    super(context);
  }

  @Override
  public String getName() {
    return "MySampleTurboModule";
  }

  @Override
  public String getString(String name) {
    return "Hello, " + name;
  }

  @Override
  public WritableArray getArray(String name) {
    WritableArray array = new WritableNativeArray();
    array.pushInt(321);
    array.pushNull();
    array.pushString("test");
    array.pushString(name);
    return array;
  }

  @Override
  public WritableMap getObject(String name) {
    return new WritableNativeMap();
  }

  @Override
  public void getPromise(String name, Promise promise) {
    return;
  }

  @Override
  public void addListener(Callback cb) {
    return;
  }
}
