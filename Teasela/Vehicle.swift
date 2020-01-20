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
    private var interiorTemperature: Int
    private var enableClimateControl: Bool
    private var enableValet: Bool
    private var enableSentry: Bool
    private var enableSpeedLimit: Bool
    private var speedLimit: Int
    private var charging: Bool
    private var location: CLLocation?
    private var battery: Double
    private var fullRange: Int
    private var currentSpeed: Double
    private var heatLevels: [Int]
    
    init(name: String = "", temperature: Int = 70, intTemperature: Int = 70, enableClimateControl: Bool = true, valet: Bool = false, sentry: Bool = true, speedLimit: Bool = true, limit: Int = 80, charging: Bool = false, location: CLLocation? = nil, battery: Double = 1.0, fullRange: Int = 322, currentSpeed: Double = 0.0, heatLvl: [Int] = [0, 0 ,0, 0, 0]) {
        self.name = name
        self.temperature = temperature
        self.interiorTemperature = intTemperature
        enableValet = valet
        enableSentry = sentry
        enableSpeedLimit = speedLimit
        self.speedLimit = limit
        self.charging = charging
        self.location = location
        self.battery = battery
        self.fullRange = fullRange
        self.currentSpeed = currentSpeed
        self.enableClimateControl = enableClimateControl
        heatLevels = [heatLvl[0],heatLvl[1],heatLvl[2],heatLvl[3],heatLvl[4]]
    }
    
    func toString() -> String {
        return "Vehicle{name=\(name), temperature=\(temperature), interior temperature=\(interiorTemperature), enable valet=\(enableValet), enable sentry=\(enableSentry), enable speed limit=\(enableSpeedLimit), speed limit=\(speedLimit), charging=\(charging), location=\(getLocationDescription() ?? "nil"), battery=\(battery), full range=\(fullRange), current speed=\(currentSpeed), enable climate control=\(enableClimateControl), seat heat levles=\(heatLevels)"
    }
    
    // MARK:- Setters and getters
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
    
    func getInteriorTemperature() -> Int {
        return interiorTemperature
    }
    
    func setInteriorTemperature(to newTemp: Int) -> Void {
        interiorTemperature = newTemp
    }
    
    func setEnableClimateControl(to newVal: Bool) -> Void {
        enableClimateControl = newVal
    }
    
    func isEnableClimateControl() -> Bool {
        return enableClimateControl
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
    
    func getHeatLevel(of seatIndex: Int) -> Int? {
        if seatIndex >= 0 && seatIndex < 5 {
            return heatLevels[seatIndex]
        } else {
            return nil
        }
    }
    
    func setHeatLevel(of seatIndex: Int, to level: Int) -> Void {
        if seatIndex < 0 && seatIndex >= 5  {
            return
        }
        if level >= 0 && level <= 3 {
            heatLevels[seatIndex] = level
        }
        
    }
    
    func setHeatLevels(_ levels: [Int]) -> Void {
        if levels.count == 5 {
            for i in 0..<5 {
                setHeatLevel(of: i, to: levels[i])
            }
        }
    }
    
    func getHeatLevels() -> [Int] {
        return heatLevels
    }
}
