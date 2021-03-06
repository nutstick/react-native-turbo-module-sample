/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @generated by codegen project: GenerateModuleObjCpp
 *
 * We create an umbrella header (and corresponding implementation) here since
 * Cxx compilation in BUCK has a limitation: source-code producing genrule()s
 * must have a single output. More files => more genrule()s => slower builds.
 */

#import "MySampleTurboModuleSpec.h"


namespace facebook {
  namespace react {
    
    static facebook::jsi::Value __hostFunction_MySampleTurboModuleSpecJSI_getString(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
      return static_cast<ObjCTurboModule&>(turboModule).invokeObjCMethod(rt, StringKind, "getString", @selector(getString:), args, count);
    }

    static facebook::jsi::Value __hostFunction_MySampleTurboModuleSpecJSI_getArray(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
      return static_cast<ObjCTurboModule&>(turboModule).invokeObjCMethod(rt, ArrayKind, "getArray", @selector(getArray:), args, count);
    }

    static facebook::jsi::Value __hostFunction_MySampleTurboModuleSpecJSI_getObject(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
      return static_cast<ObjCTurboModule&>(turboModule).invokeObjCMethod(rt, ObjectKind, "getObject", @selector(getObject:), args, count);
    }

    static facebook::jsi::Value __hostFunction_MySampleTurboModuleSpecJSI_getPromise(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
      return static_cast<ObjCTurboModule&>(turboModule).invokeObjCMethod(rt, PromiseKind, "getPromise", @selector(getPromise:resolve:reject:), args, count);
    }

    static facebook::jsi::Value __hostFunction_MySampleTurboModuleSpecJSI_addListener(facebook::jsi::Runtime& rt, TurboModule &turboModule, const facebook::jsi::Value* args, size_t count) {
      return static_cast<ObjCTurboModule&>(turboModule).invokeObjCMethod(rt, VoidKind, "addListener", @selector(addListener:), args, count);
    }

    MySampleTurboModuleSpecJSI::MySampleTurboModuleSpecJSI(const ObjCTurboModule::InitParams &params)
      : ObjCTurboModule(params) {
        
        methodMap_["getString"] = MethodMetadata {1, __hostFunction_MySampleTurboModuleSpecJSI_getString};
        
        
        methodMap_["getArray"] = MethodMetadata {1, __hostFunction_MySampleTurboModuleSpecJSI_getArray};
        
        
        methodMap_["getObject"] = MethodMetadata {1, __hostFunction_MySampleTurboModuleSpecJSI_getObject};
        
        
        methodMap_["getPromise"] = MethodMetadata {1, __hostFunction_MySampleTurboModuleSpecJSI_getPromise};
        
        
        methodMap_["addListener"] = MethodMetadata {1, __hostFunction_MySampleTurboModuleSpecJSI_addListener};
        
    }
  } // namespace react
} // namespace facebook
