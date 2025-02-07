import Foundation
import UIKit
import SafariServices

struct AppLauncher {
    static func launchApp(_ urlScheme: String) {
        print("\n=== Launching App ===")
        print("URL Scheme: \(urlScheme)")
        
        guard let url = URL(string: urlScheme) else { 
            print("❌ Invalid URL scheme: \(urlScheme)")
            return 
        }
        
        print("Checking if can open URL: \(url)")
        
        // Get the top view controller to present Safari
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first,
           let rootViewController = window.rootViewController {
            
            if url.scheme == "https" || url.scheme == "http" {
                // Use SFSafariViewController for web URLs
                let safariVC = SFSafariViewController(url: url)
                rootViewController.present(safariVC, animated: true)
                print("✅ Presented Safari View Controller")
            } else {
                // Use standard URL opening for other schemes
                UIApplication.shared.open(url, options: [:]) { success in
                    if success {
                        print("✅ Successfully opened URL: \(url)")
                    } else {
                        print("❌ Failed to open URL: \(url)")
                    }
                }
            }
        } else {
            print("❌ Could not get root view controller")
        }
    }
    
    static func getUrlScheme(for app: String) -> String? {
        print("Getting URL scheme for app: \(app)")
        switch app.lowercased() {
        case "safari":
            return "https://www.google.com"
        case "chrome":
            return "googlechrome://www.google.com"
        case "mail":
            return "mailto:"
        case "messages":
            return "sms:"
        default:
            print("❌ Unknown app: \(app)")
            return nil
        }
    }
} 