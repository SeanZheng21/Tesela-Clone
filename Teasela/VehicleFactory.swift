//
//  VehicleFactory.swift
//  Teasela
//
//  Created by Carlistle ZHENG on 1/13/20.
//  Copyright © 2020 Carlistle ZHENG. All rights reserved.
//

import Foundation
import CoreLocation

class VehicleFactory {
    
    private static var INSTANCE: Vehicle = Vehicle(name: "Meredith", temperature: 60, valet: false, sentry: true, speedLimit: false, limit: 85, charging: false, location: CLLocation(latitude: 40.7580, longitude: 73.9855), battery: 0.5, fullRange: 300, currentSpeed: 0.0);
    
    private init() {
    }
    
    public static func getVehicle() -> Vehicle {
        return VehicleFactory.INSTANCE
    }
}
