//
//  Plants.swift
//  GreenHouse
//
//  Created by S531823 on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import Foundation

/// The fundamental unit in the model, a Plant
struct Plant {
    var name: String
    var species: String
    var waterFrequency: Int
    var waterTimeFrame: String
    var sunlightDuration: Int
    var sunlightTimeFrame: String
}

class Plants {
    
    private static var _shared:Plants! // Only visible in this struct
    
    static var shared: Plants { // To access this anywhere, in the app just write Plants.shared
        if _shared == nil {
            _shared = Plants()
        }
        return _shared
    }
    
    private var plants:[Plant] = [
        Plant(name: "Spikey", species: "Cactus", waterFrequency: 1, waterTimeFrame: "week", sunlightDuration: 8, sunlightTimeFrame: "day"),
        Plant(name: "Lily", species: "Snake Plant", waterFrequency: 2, waterTimeFrame: "day", sunlightDuration: 2, sunlightTimeFrame: "day"),
        Plant(name: "Yoshi", species: "Yucca", waterFrequency: 3, waterTimeFrame: "week", sunlightDuration: 2, sunlightTimeFrame: "day"),
        Plant(name: "", species: "Tomato Plant", waterFrequency: 2, waterTimeFrame: "day", sunlightDuration: 6, sunlightTimeFrame: "day"),
        Plant(name: "Lucus", species: "", waterFrequency: 1, waterTimeFrame: "day", sunlightDuration: 1, sunlightTimeFrame: "day")
    ]
    
    private init(){
    
    }
    
    // Returns plant at a given index, nil if non-existant
    /// Example usage:  Plants.shared.getPlant(at:5)
    /// Parameter index: plant to return
    func getPlant(at index:Int)->Plant? {
        if index >= 0 && index < plants.count {
            return plants[index]
        }
        else {
            return nil
        }
    }
    
    /// Subscript Plants, so usage would be Plants.shared[5]
    subscript(index: Int) -> Plant? {
        return index >= 0 && index < plants.count ? plants[index] : nil
    }
    
    // Returns the # of plants
    func numPlants() -> Int {
        return plants.count
    }
    
    // Adds a plant to the collection
    /// Example usage: Plants.shared.add(plant:Plant(name: "", species: "Tomato Plant"), waterFrequency: [1: "day"], sunlightFrequency: [6: "day"])
    /// Parameter plant: plant to add
    func add(plant: Plant){
        plants.append(plant)
    }
    
    func delete(index: Int){
        plants.remove(at: index)
    }
    
    func edit(index: Int, plant: Plant) {
        plants[index] = plant
    }
    
}
