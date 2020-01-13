//
//  Vehicle.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/13/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import Foundation
import CoreLocation

class Vehicle {
    private var name: String
    private var temperature: Int
    private var enableValet: Bool
    private var enableSentry: Bool
    private var enableSpeedLimit: Bool
    private var speedLimit: Int
    private var charging: Bool
    private var location: CLLocation?
    private var battery: Double
    private var fullRange: Int
    private var currentSpeed: Double
    
    init(name: String = "", temperature: Int = 70, valet: Bool = false, sentry: Bool = true, speedLimit: Bool = true, limit: Int = 80, charging: Bool = false, location: CLLocation? = nil, battery: Double = 1.0, fullRange: Int = 322, currentSpeed: Double = 0.0) {
        self.name = name
        self.temperature = temperature
        enableValet = valet
        enableSentry = sentry
        enableSpeedLimit = speedLimit
        self.speedLimit = limit
        self.charging = charging
        self.location = location
        self.battery = battery
        self.fullRange = fullRange
        self.currentSpeed = currentSpeed
    }
    
    func getName() -> String {
        return name
    }
    
    func setName(to newName: String) -> Void {
        name = newName
    }
    
    func getTemperature() -> Int {
        return temperature
    }
    
    func setTemperature(to newTemp: Int) -> Void {
        temperature = newTemp
    }
    
    func isEnableValet() -> Bool {
        return enableValet
    }
    
    func setEnableValet(to newVal: Bool) -> Void {
        enableValet = newVal
    }
    
    func isEnableSentry() -> Bool {
        return enableSentry
    }
    
    func setEnableSentry(to newVal: Bool) -> Void {
        enableSentry = newVal
    }
    
    func isEnableSpeedLimit() -> Bool {
        return enableSpeedLimit
    }
    
    func setEnableSpeedLimit(to newVal: Bool) -> Void {
        enableSpeedLimit = newVal
    }
    
    func isCharging() -> Bool {
        return charging
    }
    
    func setCharging(to newVal: Bool) -> Void {
        charging = newVal
    }
    
    func getLocation() -> CLLocation? {
        return location
    }
    
    func getLocationDescription() -> String? {
        return location?.description
    }
    
    func setLocation(to newLocation: CLLocation?) {
        location = newLocation
    }
    
    func isSummonAvailable(from location: CLLocation) -> Bool {
        if let carLocation = self.location {
            // Only available from within 200 ft
            return carLocation.distance(from: location) < 61
        } else {
            return false
        }
    }
    
    func getBattery() -> Double {
        return battery
    }
    
    func setBattery(to newVal: Double) -> Void {
        battery = newVal
    }
    
    func getFullRange() -> Int {
        return fullRange
    }
    
    func setFullRange(to newVal: Int) -> Void {
        fullRange = newVal
    }
    
    func getMileLeft() -> Int {
        return Int(Double(fullRange) * battery)
    }
    
    func getCurrentSpeed() -> Double {
        return currentSpeed
    }
    
    func setCurrentSpeed(to newSpeed: Double) -> Void {
        currentSpeed = newSpeed
    }
    
    func isParked() -> Bool {
        return currentSpeed == 0.0
    }
}
