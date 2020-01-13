//
//  ClimateViewController.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/10/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit

class ClimateViewController: UIViewController {

    private static var DEFAULT_TEMP = 72
    private var temperature: Int = ClimateViewController.DEFAULT_TEMP
    private static var DEFAULT_INTERIOR_TEMP = 72
    private var interiorTemp: Int = ClimateViewController.DEFAULT_INTERIOR_TEMP
    private var enableClimateControl: Bool = true
    private var heatLevels: [Int] = [0, 0 ,0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
        heatLevels = [0, 0 ,0, 0, 0]
        setEnableControl(to: true)
        setTemperature(to: ClimateViewController.DEFAULT_TEMP)
        setInteriorTemperature(to: ClimateViewController.DEFAULT_INTERIOR_TEMP)
    }
    
    // TODO: Seat heat levels
    
    // MARK: - Outlets
    @IBOutlet weak var intTempLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var onOffButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // MARK: - Setters
    @IBAction func turnOnOffTouched(_ sender: UIButton) {
        setEnableControl(to: !enableClimateControl)
    }
    
    func setEnableControl(to enable: Bool) {
        enableClimateControl = enable;
        onOffButton.setTitle(( enable ?  "TURN OFF" : "TURN ON"), for: .normal)
        backgroundImageView.image = UIImage(named: "Climate Background" + (enable ? " Enabled" : ""))
    }
    
    @IBAction func touchMinusTemperature(_ sender: UIButton) {
        setTemperature(to: temperature - 1)
    }
    
    @IBAction func touchPlusTemperature(_ sender: UIButton) {
        setTemperature(to: temperature + 1)
    }
    
    private func setTemperature(to temp: Int) {
        temperature = temp
        temperatureLabel.text = "\(temperature)°F"
        
        // Set interior temperature too, maybe change later
        setInteriorTemperature(to: temp)
    }
    
    private func setInteriorTemperature(to intTemp: Int) {
        interiorTemp = intTemp
        intTempLabel.text = "Interior \(intTemp)°F"
    }
    
    // MARK: - Seats
    
    private func increaseHeat(on idx: Int, of seatButton: UIButton) -> Void {
        let level: Int
        if heatLevels[idx] < 3 {
            level = heatLevels[idx] + 1
        } else {
            level = 0
        }
        heatLevels[idx] = level
        seatButton.setBackgroundImage(UIImage(named: "Heat \(level)"), for: .normal)
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
