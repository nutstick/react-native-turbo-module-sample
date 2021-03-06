package com.example.reactnativeturbomodulesample;

import com.facebook.react.ReactActivity;
import com.facebook.react.ReactInstanceManager;
import com.facebook.react.bridge.ReactContext;
import com.example.reactnativeturbomodulesample.MyHybrid;

public class MainActivity extends ReactActivity implements ReactInstanceManager.ReactInstanceEventListener {

  @Override
  public void onResume() {
      super.onResume();
      getReactInstanceManager().addReactInstanceEventListener(this);
  }

  @Override
  public void onPause() {
      super.onPause();
      getReactInstanceManager().removeReactInstanceEventListener(this);
  }

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  @Override
  protected String getMainComponentName() {
    return "TurboModuleSampleExample";
  }

  @Override
  public void onReactContextInitialized(ReactContext context) {
    new MyHybrid().setup(context);
  }
}
