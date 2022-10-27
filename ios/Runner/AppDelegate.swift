import UIKit
import Flutter
import YandexMapsMobile

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     YMKMapKit.setApiKey("cf2d8184-12c4-4ea7-8691-44a340630019") // Your generated API key
     GeneratedPluginRegistrant.register(with: self)
//       FirebaseApp.configure()
     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
