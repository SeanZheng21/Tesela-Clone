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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setEnableControl(to: true)
        setTemperature(to: ClimateViewController.DEFAULT_TEMP)
        setInteriorTemperature(to: ClimateViewController.DEFAULT_INTERIOR_TEMP)
    }
    
    // TODO: Seat heat levels
    
    // MARK: - Outlets
    @IBOutlet weak var intTempLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var onOffButton: UIButton!
    
    // MARK: - Setters
    @IBAction func turnOnOffTouched(_ sender: UIButton) {
        setEnableControl(to: !enableClimateControl)
    }
    
    func setEnableControl(to enable: Bool) {
        enableClimateControl = enable;
        onOffButton.setTitle(( enable ?  "TURN OFF" : "TURN ON"), for: .normal)
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
        intTempLabel.text = "\(intTemp)°F"
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
