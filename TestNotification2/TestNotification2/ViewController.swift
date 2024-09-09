//
//  ViewController.swift
//  TestNotification2
//
//  Created by iPhoneDev1 on 25/08/23.
//

import UIKit
import CoreBluetooth
class ViewController: UIViewController {
    
    var peripherals:[CBPeripheral] = []
    var centralManager: CBCentralManager!
    
    let bundleId = "Agnik.TestNotification2"
    let deviceId = "041DBE18383EEEEFD6A29052B8E067009AA5BF1DB857FE134C26B9B32A499A5F"//"00008110-00021DD20A98401E"
    let payload = [
         "aps": [
             "alert": [
                 "title": "Notification Title",
                 "body": "Notification Body"
             ]
         ]
     ]
    
    
    @IBAction func checkButton(_ sender: Any) {
        let vc  = BlueToothListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


