//
//  SummonViewController.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/10/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit

class SummonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeSummon()
    }
    
    private func initializeSummon() -> Void {
        forwardButton.isEnabled = false
        reverseButton.isEnabled = false
        topLineLabel.text = "Connecting to your vehicle"
        bottomLineLabel.text = ""
        backgroundImageView.image = UIImage(named: "Summon Background")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.topLineLabel.text = "Summon is ready"
            self.bottomLineLabel.text = "Please make sure the doors are closed\nand the vehicle is not charging"
            self.forwardButton.isEnabled = true
            self.reverseButton.isEnabled = true
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var topLineLabel: UILabel!
    @IBOutlet weak var bottomLineLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    @IBOutlet weak var forwardButton: UIButton!
    @IBAction func forwardButtonTouchDown(_ sender: UIButton) {
        backgroundImageView.image = UIImage(named: "Summon Background Forward")
        topLineLabel.text = ""
        bottomLineLabel.text = "Release the direction button to\n stop your vehicle"
        reverseButton.isEnabled = false
    }
    
    @IBAction func forwardButtonTouchUp(_ sender: UIButton) {
        backgroundImageView.image = UIImage(named: "Summon Background")
        forwardButton.isEnabled = false
        topLineLabel.text = "Summon is stopping..."
        bottomLineLabel.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.reverseButton.isEnabled = true
            self.forwardButton.isEnabled = true
            self.topLineLabel.text = ""
            self.bottomLineLabel.text = "Press and hold a direction button\n to start Summon"
        }
    }
    
    @IBOutlet weak var reverseButton: UIButton!
    @IBAction func reverseButtonTouchDown(_ sender: UIButton) {
        backgroundImageView.image = UIImage(named: "Summon Background Backward")
        topLineLabel.text = ""
        bottomLineLabel.text = "Release the direction button to\n stop your vehicle"
        forwardButton.isEnabled = false
    }
    @IBAction func reverseButtonTouchUp(_ sender: UIButton) {
        backgroundImageView.image = UIImage(named: "Summon Background")
        topLineLabel.text = "Summon is stopping..."
        bottomLineLabel.text = ""
        reverseButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.forwardButton.isEnabled = true
            self.topLineLabel.text = ""
            self.reverseButton.isEnabled = true
            self.bottomLineLabel.text = "Press and hold a direction button\n to start Summon"
        }
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
