//
//  ServiceViewController.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/11/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import UIKit
import SafariServices

class ServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private static let faqURL = "https://www.tesla.com/support/frequently-asked-questions"
    private static let searchBaseURL = "https://www.tesla.com/support/results#q="
    
    private var keywords: String = ""

    private var services: [String] = ["12v Battery", "Accessory Installation & Upgrades", "Alert Appeared",
        "Audio, Infotainment & Touchscreen", "Door Handles & Trunk Latches", "Driver Assistance Features",
        "Glass Replacement", "Heating & Air Conditioning", "Key Fob & Key Card", "Lighting", "Maintenance",
        "Noise or Vibration", "Paint or Dent", "Range & Charging", "Interior & Exterior Trim", "Seats",
        "Software Update", "Tires & Wheels", "Window & Wiper Function", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func exitButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTouched(_ sender: UIButton) {
        showSafariVC(for: ServiceViewController.searchBaseURL + keywords.replacingOccurrences(of: " ", with: "%20"))
    }
    
    @IBAction func visitFAQButtonTouched(_ sender: UIButton) {
        showSafariVC(for: ServiceViewController.faqURL)
    }
    
    private func showSafariVC(for url: String) -> Void {
            guard let url = URL(string: url) else {
            let alert = UIAlertController(title: "Connection Error", message: "Can't access the Tesla FAQ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(alert: UIAlertAction!) in self.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceTableViewCell
        cell.setServiceName(to: services[indexPath.row])
        cell.uncheckService()
        return cell
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        keywords += services[indexPath.row]
        keywords += ", "
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceTableViewCell
        if cell.isChecked() {
            cell.uncheckService()
        } else {
            cell.checkService()
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
