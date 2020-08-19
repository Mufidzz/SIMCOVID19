import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
           GMSServices.provideAPIKey("AIzaSyAsV7sNWF5i-DctuMNplf71jVqzXzZvBYY")
           GeneratedPluginRegistrant.register(with: self)
           return super.application(application, didFinishLaunchingWithOptions: launchOptions)
         }
}
