//
//  DeviceViewCell.swift
//  TestNotification2
//
//  Created by iPhoneDev1 on 09/09/24.
//

import UIKit

class DeviceViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var descr: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
  var deviceItem: DeviceItem?
    func init_cell(deviceItem: DeviceItem){
        self.title.text = deviceItem.name
        self.descr.text = "Signal strength: "+String(deviceItem.rssi)+"\n"+deviceItem.id.uuidString
        self.deviceItem = deviceItem
        
        mainView.setShadow(opacityValue: 0.3, radiusValue: 3)
        mainView.layer.cornerRadius = 5
    }
    
}
