//
//  RootTableViewController.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/10/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit
import CoreLocation

class RootTableViewController: UITableViewController {
    
    private var vehicle: Vehicle = Vehicle()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        fanButton.layer.borderColor = UIColor.white.cgColor
        fanButton.layer.borderWidth = 2
        fanButton.layer.cornerRadius = fanButton.bounds.size.width
        frunkButton.layer.borderColor = UIColor.white.cgColor
        frunkButton.layer.borderWidth = 2
        frunkButton.layer.cornerRadius = frunkButton.bounds.size.width
        lockButton.layer.borderColor = UIColor.white.cgColor
        lockButton.layer.borderWidth = 2
        lockButton.layer.cornerRadius = lockButton.bounds.size.width
        
        updatePhoneKeyStatus()
        initVehicle()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var batteryTitleLabel: UILabel!
    @IBOutlet weak var rangeTitleLabel: UILabel!
    @IBOutlet weak var parkedTitleLabel: UILabel!
    
    
    @IBOutlet weak var fanButton: UIButton!
    @IBOutlet weak var frunkButton: UIButton!
    @IBOutlet weak var lockButton: UIButton!
    
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var controlsLabel: UILabel!
    @IBOutlet weak var chargingLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var summonLabel: UILabel!
    
    // MARK: - Phone Key
    private var blueToothEnabled: Bool = false
    @IBOutlet weak var phoneKeyDetailLabel: UILabel!
    @IBOutlet weak var phoneKeyButton: UIButton!
    @IBAction func phoneKeyTouched(_ sender: UIButton) {
        if blueToothEnabled {
            let alert = UIAlertController(title: "Phone Key Enabled", message: "Now you can use your phone as the key to your car", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Bluetooth is off", message: "Bluetooth is needed for Phone Key. Go to Settings to turn on bluetooth.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { action in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
    }
    
    
    private func initVehicle() -> Void {
        vehicle = VehicleFactory.getVehicle()
        navigationBar.title = vehicle.getName()
        climateLabel.text = "Interior \(vehicle.getTemperature())°F"
        if vehicle.isEnableValet() {
            controlsLabel.text = "Valet Mode Active"
        } else if vehicle.isEnableSentry() {
            controlsLabel.text = "Sentry Mode Active"
        } else if vehicle.isEnableSpeedLimit() {
            controlsLabel.text = "Speed Limit Mode Active"
        } else {
            controlsLabel.text = "No Active Mode"
        }
        chargingLabel.text = vehicle.isCharging() ? "Charging" : "Not Charging"
        if let locDesc = vehicle.getLocation() {
            locationLabel.text = "\(locDesc.coordinate.latitude)° N, \(locDesc.coordinate.longitude)° W"
        } else {
            locationLabel.text = "Unavailable"
        }
        summonLabel.text = vehicle.isSummonAvailable(from: CLLocation(latitude: 40.7580, longitude: 73.9855)) ? "Available" : "Unavailable"
        batteryTitleLabel.text = "Battery: \(Int(round(vehicle.getBattery() * 100)))%"
        rangeTitleLabel.text = "\(vehicle.getMileLeft()) mi"
        parkedTitleLabel.text = vehicle.isParked() ? "Parked" : ""
        
    }
    
    /**
     Check the bluetooth status and try to connect
     */
    func updatePhoneKeyStatus() -> Void {

        let bluetoothOn: Bool = Bool.random()
        blueToothEnabled = bluetoothOn
        if bluetoothOn {
            phoneKeyDetailLabel.text = "Connected"
            phoneKeyButton.setBackgroundImage(UIImage(named: "info.circle"), for: .normal)
        } else {
            phoneKeyDetailLabel.text = "Bluetooth off"
            phoneKeyButton.setBackgroundImage(UIImage(named: "info.circle"), for: .normal)

        }
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Disable the section header
        return nil
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        // Disable the section footer
        return nil
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }        
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
