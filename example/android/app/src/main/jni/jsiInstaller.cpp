#include <jsi/jsi.h>
#include <fbjni/fbjni.h>
#include <ReactCommon/CallInvokerHolder.h>
#include <ReactCommon/CallInvoker.h>
#include <ReactCommon/JavaTurboModule.h>
#include "MySampleTurboModuleSpec.h"

using namespace facebook::jni;

class MyHybrid : public jni::HybridClass<MyHybrid> {
 public:
  static auto constexpr kJavaDescriptor =
      "Lcom/example/reactnativeturbomodulesample/MyHybrid;";

   static void initHybrid(
        jni::alias_ref<jhybridobject> jThis,
        jlong jsContext,
        jni::alias_ref<facebook::react::CallInvokerHolder::javaobject> jsCallInvokerHolder,
        jni::alias_ref<facebook::react::CallInvokerHolder::javaobject> nativeCallInvokerHolder,
        jni::alias_ref<facebook::react::JTurboModule> instance)
    {
      jsi::Runtime *runtime = (jsi::Runtime *)jsContext;
      std::shared_ptr<facebook::react::CallInvoker> jsCallInvoker = jsCallInvokerHolder->cthis()->getCallInvoker();
      std::shared_ptr<facebook::react::CallInvoker> nativeCallInvoker = nativeCallInvokerHolder->cthis()->getCallInvoker();
      std::string moduleName = "MySampleTurboModule";
      std::shared_ptr<facebook::react::MySampleTurboModuleSpecJSI> nativeModule =
          std::make_shared<facebook::react::MySampleTurboModuleSpecJSI>(
            facebook::react::JavaTurboModule::InitParams{
              moduleName,
              instance,
              jsCallInvoker,
              nativeCallInvoker,
            });

      runtime->global().setProperty(
            *runtime,
            jsi::PropNameID::forAscii(*runtime, "mySampleTurboModule"),
            jsi::Object::createFromHostObject(*runtime, nativeModule));
    }

  static void registerNatives() {
    javaClassStatic()->registerNatives({
        makeNativeMethod("initHybrid", MyHybrid::initHybrid),
    });
  }

 private:
  friend HybridBase;

};

JNIEXPORT jint JNI_OnLoad(JavaVM* vm, void*) {
    return facebook::jni::initialize(vm, [] {
        MyHybrid::registerNatives();
    });
}

