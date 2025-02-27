#pragma once

#include <ABI46_0_0jsi/ABI46_0_0jsi.h>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
#include "RuntimeManager.h"
#include "SharedParent.h"
#include "WorkletsCache.h"

using namespace ABI46_0_0facebook;

namespace ABI46_0_0reanimated {

class FrozenObject : public jsi::HostObject {
  friend WorkletsCache;
  friend void extractMutables(
      jsi::Runtime &rt,
      std::shared_ptr<ShareableValue> sv,
      std::vector<std::shared_ptr<MutableValue>> &res);

 private:
  std::unordered_map<std::string, std::shared_ptr<ShareableValue>> map;
  std::vector<std::string> namesOrder;

 public:
  FrozenObject(
      jsi::Runtime &rt,
      const jsi::Object &object,
      RuntimeManager *runtimeManager);
  jsi::Object shallowClone(jsi::Runtime &rt);
  bool containsHostFunction = false;
};

} // namespace reanimated
