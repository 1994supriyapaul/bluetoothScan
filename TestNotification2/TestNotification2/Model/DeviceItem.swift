//
//  DeviceItem.swift
//  TestNotification2
//
//  Created by iPhoneDev1 on 09/09/24.
//

import Foundation
struct DeviceItem: Identifiable, Decodable {
    let id: UUID
    let name: String
    let rssi: Int // signal strength
    
    init(id: UUID, name: String, rssi: Int) {
        self.id = id
        self.name = name
        self.rssi = rssi
    }
    
}
