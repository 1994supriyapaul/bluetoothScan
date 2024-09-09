//
//  BlueToothListViewController.swift
//  TestNotification2
//
//  Created by iPhoneDev1 on 09/09/24.
//

import UIKit
import CoreBluetooth
class BlueToothListViewController: UIViewController {
    
    let blueToothViewModel = BlueToothViewModel()
   
    @IBOutlet weak var deviceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // centralManager = CBCentralManager(delegate: self, queue: .main)
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        configureTableView()
        blueToothViewModel.delegate = self
        
        // Do any additional setup after loading the view.
    }


    func configureTableView() {
        deviceTableView.delegate = self
        deviceTableView.dataSource = self
        let nibName = UINib(nibName: "DeviceViewCell", bundle: nil)
        deviceTableView.register(nibName, forCellReuseIdentifier: "DeviceViewCell")
        deviceTableView.estimatedRowHeight = 100
        deviceTableView.rowHeight = UITableView.automaticDimension
       
        
    }

}

extension BlueToothListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blueToothViewModel.peripheralList.count
  }
   
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceViewCell", for: indexPath) as! DeviceViewCell
        cell.init_cell(deviceItem: blueToothViewModel.peripheralList[indexPath.row])
    return cell
  }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peripheral = blueToothViewModel.peripherals[indexPath.row]
        blueToothViewModel.centralManager?.connect(peripheral, options: nil)
    print("Details : ", peripheral)
  }
}
