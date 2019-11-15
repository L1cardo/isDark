//
//  AppDelegate.swift
//  isDark
//
//  Created by Licardo on 2019/11/15.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var image: NSImageView!
    @IBOutlet weak var text: NSTextField!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(getAppearance),
            name: NSNotification.Name(rawValue: "AppleInterfaceThemeChangedNotification"),
            object: nil
        )
        
        getAppearance()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func getAppearance() {
        var isDarkMode = false
        if let appleInterfaceStyle = UserDefaults.standard.object(forKey: "AppleInterfaceStyle") as? String {
            if appleInterfaceStyle.lowercased().contains("dark") {
                isDarkMode = true
            }
        }
        
        image.image = NSImage(named: isDarkMode ? "Dark" : "Light")
        text.stringValue = isDarkMode ? "Dark" : "Light"
    }
    
    @IBAction func licardo(_ sender: NSButton) {
        guard let url = URL(string: "https://github.com/L1cardo") else { return }
        NSWorkspace.shared.open(url)
    }
    
}

