package abi46_0_0.host.exp.exponent.modules.api.screens.events

import abi46_0_0.com.facebook.react.bridge.Arguments
import abi46_0_0.com.facebook.react.uimanager.events.Event
import abi46_0_0.com.facebook.react.uimanager.events.RCTEventEmitter

class HeaderBackButtonClickedEvent(viewId: Int) : Event<ScreenAppearEvent>(viewId) {
  override fun getEventName(): String {
    return EVENT_NAME
  }

  override fun getCoalescingKey(): Short {
    // All events for a given view can be coalesced.
    return 0
  }

  override fun dispatch(rctEventEmitter: RCTEventEmitter) {
    rctEventEmitter.receiveEvent(viewTag, eventName, Arguments.createMap())
  }

  companion object {
    const val EVENT_NAME = "topHeaderBackButtonClickedEvent"
  }
}
