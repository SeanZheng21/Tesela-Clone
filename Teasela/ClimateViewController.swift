//
//  ClimateViewController.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/10/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit

class ClimateViewController: UIViewController {

    private var vehicle: Vehicle = Vehicle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
        updateOutletsFromVehicle()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var intTempLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var onOffButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // MARK: - Setters
    private func updateOutletsFromVehicle() -> Void {
        setEnableControl(to: vehicle.isEnableClimateControl())
        setTemperature(to: vehicle.getTemperature())
        setInteriorTemperature(to: vehicle.getInteriorTemperature())
        setEnableControl(to: vehicle.isEnableClimateControl())
        setHeatLevels(vehicle.getHeatLevels())
    }
    
    
    @IBAction func turnOnOffTouched(_ sender: UIButton) {
        setEnableControl(to: !vehicle.isEnableClimateControl())
    }
    
    func setEnableControl(to enable: Bool) {
        vehicle.setEnableClimateControl(to: enable)
        onOffButton.setTitle(( enable ?  "TURN OFF" : "TURN ON"), for: .normal)
        backgroundImageView.image = UIImage(named: "Climate Background" + (enable ? " Enabled" : ""))
    }
    
    @IBAction func touchMinusTemperature(_ sender: UIButton) {
        setTemperature(to: vehicle.getTemperature() - 1)
    }
    
    @IBAction func touchPlusTemperature(_ sender: UIButton) {
        setTemperature(to: vehicle.getTemperature() + 1)
    }
    
    private func setTemperature(to temp: Int) {
        vehicle.setTemperature(to: temp)
        temperatureLabel.text = "\(temp)°F"
    }
    
    private func setInteriorTemperature(to intTemp: Int) {
        vehicle.setInteriorTemperature(to: intTemp)
        intTempLabel.text = "Interior \(intTemp)°F"
    }
    
    func setVehicle(to vehicle: Vehicle) -> Void {
        self.vehicle = vehicle
    }
    
    // MARK: - Seats
    
    private func increaseHeat(on idx: Int, of seatButton: UIButton) -> Void {
        let level: Int
        if vehicle.getHeatLevel(of: idx)! < 3 {
            level = vehicle.getHeatLevel(of: idx)! + 1
        } else {
            level = 0
        }
        setHeat(on: idx, to: level)
//        print(seatButton.state)
//        print("Setting heat level\(idx) to \(level)")
        seatButton.setBackgroundImage(UIImage(named: "Heat \(level)"), for: .normal)
    }
    
    func setHeat(on idx: Int, to level: Int) -> Void {
        vehicle.setHeatLevel(of: idx, to: level)
    }
    
    func setHeatLevels(_ levels: [Int]) -> Void {
        setHeat(on: 0, to: levels[0])
        seatOneButton.setBackgroundImage(UIImage(named: "Heat \(levels[0])"), for: .normal)
        setHeat(on: 1, to: levels[1])
        seatTwoButton.setBackgroundImage(UIImage(named: "Heat \(levels[1])"), for: .normal)
        setHeat(on: 2, to: levels[2])
        seatThreeButton.setBackgroundImage(UIImage(named: "Heat \(levels[2])"), for: .normal)
        setHeat(on: 3, to: levels[3])
        seatFourButton.setBackgroundImage(UIImage(named: "Heat \(levels[3])"), for: .normal)
        setHeat(on: 4, to: levels[4])
        seatFiveButton.setBackgroundImage(UIImage(named: "Heat \(levels[4])"), for: .normal)
    }
    
    @IBOutlet weak var seatOneButton: UIButton!
    @IBOutlet weak var seatTwoButton: UIButton!
    @IBOutlet weak var seatThreeButton: UIButton!
    @IBOutlet weak var seatFourButton: UIButton!
    @IBOutlet weak var seatFiveButton: UIButton!
    
    @IBAction func seatOneTouched(_ sender: UIButton) {
        increaseHeat(on: 0, of: sender)
    }
    
    @IBAction func seatTwoTouched(_ sender: UIButton) {
        increaseHeat(on: 1, of: sender)
    }
    
    @IBAction func seatThreeTouched(_ sender: UIButton) {
        increaseHeat(on: 2, of: sender)
    }
    
    @IBAction func seatFourTouched(_ sender: UIButton) {
        increaseHeat(on: 3, of: sender)
    }
    
    @IBAction func seatFiveTouched(_ sender: UIButton) {
        increaseHeat(on: 4, of: sender)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
