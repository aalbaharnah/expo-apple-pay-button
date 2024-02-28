package expo.modules.applepaybutton

import expo.modules.kotlin.Promise
import expo.modules.kotlin.modules.Module
import expo.modules.kotlin.modules.ModuleDefinition

class ExpoApplePayButtonModule : Module() {
  override fun definition() = ModuleDefinition {
    Name("ExpoApplePayButton")

    AsyncFunction("startPaymentAsync") { items: String?, promise: Promise ->
      try {
        promise.resolve("ok");
      } catch (e: Exception) {
        promise.resolve("ok");
      }
    }
  }
}
