//
//  BlueToothViewModel.swift
//  TestNotification2
//
//  Created by iPhoneDev1 on 09/09/24.
//
import UIKit
import CoreBluetooth
class BlueToothViewModel: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
   
    var peripherals:[CBPeripheral] = []
    var peripheralList:[DeviceItem] = []
    var centralManager: CBCentralManager!
    var isCompleted:Bool = false, isConnected:Bool = false
    var delegate:BlueToothListViewController?
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
            if central.state == .poweredOn {
                self.centralManager?.scanForPeripherals(withServices: nil)
            }
        }
        
        func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
            print("Discovered \(peripheral.name ?? "unknown device") \(peripheral)")
            if !peripherals.contains(peripheral) {
                self.peripherals.append(peripheral)
                self.peripheralList.append(DeviceItem(id: peripheral.identifier, name: peripheral.name ?? "unnamed device", rssi: Int(RSSI)) )
            }
            isCompleted = true
            delegate?.deviceTableView.reloadData()
        }
    
    
    // CBCentralManagerDelegate method
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) { print("Connected to \(peripheral.name ?? "Unknown")") // Set delegate and discover services
        let alert = UIAlertController(title: "Connected", message: "Connected to \(peripheral.name ?? "Unknown")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        delegate?.present(alert, animated: true, completion: nil)
        isConnected = true
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
        // CBPeripheralDelegate method
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let error = error { print("Error discovering services: \(error.localizedDescription)")
            return
        }
        // Discover characteristics for each service
        for service in peripheral.services ?? [] { peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    // CBPeripheralDelegate method
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error = error {
        print("Error discovering characteristics: \(error.localizedDescription)")
        return
          }
        // Do something with discovered characteristics
        for characteristic in service.characteristics ?? [] { 
            print("Discovered characteristic: \(characteristic.uuid)") } }

    func centralManager( _ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
      print("Connection failed \(error) ")
    }
    
    
    
}
