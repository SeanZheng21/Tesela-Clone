//
//  ChargeViewController.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/10/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit

class ChargeViewController: UIViewController {
    
    private static var DEFAULT_FULL_RANGE = 322
    private var currentBattery = 0.5
    private var chargePercentage = 1.0
    private var batteryFullRange = ChargeViewController.DEFAULT_FULL_RANGE
    private var chargePortOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
        setFullRange(to: ChargeViewController.DEFAULT_FULL_RANGE)
        setBatteryPercentage(to: 0.52)
        setChargePercentage(to: 0.9)
        setPortOpened(to: false)
    }

    func setFullRange(to fullRangeMiles: Int) -> Void {
        batteryFullRange = fullRangeMiles
    }
    
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var batteryLabel: UILabel!
    @IBOutlet weak var batterySlider: UISlider!
    @IBAction func batterySliderSlided(_ sender: UISlider) {
        if Double(sender.value) > currentBattery {
            setChargePercentage(to: Double(sender.value))
        } else {
            sender.value = Float(currentBattery)
        }
    }
    
    private func setBatteryPercentage(to percentage: Double) -> Void {
        currentBattery = percentage
        batteryLabel.text = "Battery \(Int(percentage * 100))%"
        milesLabel.text = "\(Int(Double(batteryFullRange) * percentage)) miles"
    }
    
    private func setChargePercentage(to percentage: Double) -> Void {
        chargePercentage = percentage
        batterySlider.value = Float(percentage)
    }
    
    @IBOutlet weak var openChargePortButton: UIButton!
    @IBAction func openChargePortTouched(_ sender: UIButton) {
        setPortOpened(to: true)
    }
    
    func setPortOpened(to opened: Bool) -> Void {
        chargePortOpened = opened
        openChargePortButton.isEnabled = !opened
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
