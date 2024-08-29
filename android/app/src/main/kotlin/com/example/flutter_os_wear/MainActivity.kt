package com.example.flutter_os_wear

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "wear"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getShape") {
                val shape = getShape()
                result.success(shape)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getShape(): String {
        // Replace with actual logic to determine the shape (e.g., round or square)
        return "round"  // or "square"
    }
}
