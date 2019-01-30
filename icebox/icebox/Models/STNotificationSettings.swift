//
//  STNotificationSettings.swift
//  icebox
//
//  Created by Jesús Tirado on 1/25/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import Foundation

class STNotificationSettings: NSObject {
    static let KEY = "ST_NOTIFICATIONS"
    static let shared = STNotificationSettings()
    
    private override init() {}
    
    private var settings: [String: Bool] {
        get {
            let key = STNotificationSettings.KEY
            
            if let settings = UserDefaults.standard.object(forKey: key) as? [String: Bool] {
                return settings
            }
            
            return [:]
        }
        set(newValue) {
            var settings: [String: Bool] = [:]
            
            for (k, v) in newValue {
                settings[k.uppercased()] = v
            }
            
            UserDefaults.standard.set(settings, forKey: STNotificationSettings.KEY)
        }
    }
    
    func enabled(for stock: String) -> Bool {
        if let stock = settings.first(where: { $0.key == stock.uppercased() }) {
            return stock.value
        }
        
        return false
    }
    
    func save(stock: String, enabled: Bool) {
        settings[stock.uppercased()] = enabled
    }
}
