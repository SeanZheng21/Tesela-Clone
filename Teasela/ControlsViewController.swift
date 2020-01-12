//
//  ControlsViewController.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/10/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit

class ControlsViewController: UIViewController {

    private static var DEFAULT_SPEED_LIMIT = 130
    private var enableValet = false
    private var enableSentry = true
    private var enableSpeedLimit = true
    private var speedLimit = ControlsViewController.DEFAULT_SPEED_LIMIT
    private var enableLock = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view.
        setLock(to: false)
        setValet(to: false)
        setSentry(to: true)
        setSpeedLimit(to: true)
        setSpeedLimitValue(to: 125)
    }
    
    // MARK: - Lock
    @IBOutlet weak var lcokUnlockButton: UIButton!
    @IBOutlet weak var lockImage: UIImageView!
    @IBAction func touchLockUnlock(_ sender: UIButton) {
        setLock(to: !enableLock)
    }
    private func setLock(to lock: Bool) {
        enableLock = lock
        lcokUnlockButton.setTitle((enableLock ? "UNLOCK" : "LOCK"), for: .normal)
        lockImage.image = UIImage(named: (enableLock ? "Locked" : "Unlocked"))
    }
    
    // MARK: - Five Actions
    @IBAction func flashTouched(_ sender: UIButton) {
        // Animate flash
    }
    
    @IBAction func honkTouched(_ sender: UIButton) {
        // Animate honk
    }
    
    @IBAction func startTouched(_ sender: UIButton) {
        // Animate start
    }
    
    @IBAction func frontTrunkTouched(_ sender: UIButton) {
        // Animate front trunk
    }
    
    @IBAction func trunkTouched(_ sender: UIButton) {
        // Animate trunk
    }
    
    // MARK: - Valet Mode
    @IBAction func valetSwitched(_ sender: UISwitch) {
        setValet(to: sender.isOn)
    }
    
    private func setValet(to enableValet: Bool) -> Void {
        self.enableValet = enableValet
    }
    
    // MARK: - Sentry Mode
    @IBAction func sentrySwitched(_ sender: UISwitch) {
        setSentry(to: sender.isOn)
    }
    
    private func setSentry(to enableSentry: Bool) -> Void {
        self.enableSentry = enableSentry
    }
    
    // MARK: - Speed Limit Mode
    @IBAction func speedLimitSwitched(_ sender: UISwitch) {
        setSpeedLimit(to: sender.isOn)
    }
    
    func setSpeedLimit(to enableSpeedLimit: Bool) -> Void {
        self.enableSpeedLimit = enableSpeedLimit
    }
    
    // MARK: - Speed Limit Value
    @IBOutlet weak var speedLimitValueLabel: UILabel!
    @IBAction func decrementSpeedLimit(_ sender: UIButton) {
        setSpeedLimitValue(to: speedLimit - 1)
    }
    
    @IBAction func incrementSpeedLimit(_ sender: UIButton) {
        setSpeedLimitValue(to: speedLimit + 1)
    }
    
    func setSpeedLimitValue(to limit: Int) -> Void {
        speedLimit = limit
        speedLimitValueLabel.text = "\(speedLimit) MPH"
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
