//
//  main.swift
//  lesson5
//
//  Created by Vladislav Elkin on 31.07.2020.
//  Copyright © 2020 Vladislav Elkin. All rights reserved.
//

import Foundation


enum DoorState{
    case open, close;
}

enum EngineState{
    case start, stop;
}

enum VolumeState{
    case full, empty;
}

enum VolumeAction {
    case add, get;
}

protocol AbstractCar {
      var brand: String {get set}
      var year: Int {get set}
      var trunkVolume: Double {get set}
      var engineState: EngineState {get set}
      var doorState: DoorState {get set}
      var volumeState: VolumeState {get set}

}

extension AbstractCar {
    mutating func changeDoorState (state: DoorState){
        self.doorState = state;
    }
    
    mutating func changeEngineState(state: EngineState){
        self.engineState = state;
    }
    
    mutating func changeVolume(action: VolumeAction, count: Double)
    {
        switch action {
            
        case .add where volumeState == .full:
            print("Trunk is full");
        case.add where count >= trunkVolume:
            volumeState = .full;
            print("All added, Trunk is full");
        case .add:
            print("Added: \(count)");
            
            
        case .get where volumeState == .empty:
            print("Trunk is empty");
        case .get where count >= trunkVolume:
            volumeState = .empty;
            print("Trunk is empty");
        case .get:
            print("Get: \(count)");
            
        }
    }
}


    class TrunkCar: AbstractCar {
        var brand: String
        var year: Int
        var trunkVolume: Double
        var engineState: EngineState
        var doorState: DoorState
        var volumeState: VolumeState
        var destination: String
        
        init(brand: String, year: Int, trunkVolume: Double, engineState: EngineState, doorState: DoorState, volumeState: VolumeState, destination: String) {
            self.brand = brand;
            self.year = year;
            self.trunkVolume = trunkVolume;
            self.engineState = engineState;
            self.doorState = doorState;
            self.volumeState = volumeState;
            self.destination = destination;
        }

    }

extension TrunkCar: CustomStringConvertible{
    var description: String {
        return "Brand: \(brand) Year: \(year) TrunkVolume: \(trunkVolume) EngineState: \(engineState) DoorState: \(doorState) VolumeState: \(volumeState) Destination: \(destination)";
    }
    
    
}

class SportCar: AbstractCar {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var engineState: EngineState
    var doorState: DoorState
    var volumeState: VolumeState
    var maxSpeed: Int
    var power: Int
    
    init(brand: String, year: Int, trunkVolume: Double, engineState: EngineState, doorState: DoorState, volumeState: VolumeState, maxSpeed: Int, power: Int) {
        self.brand = brand;
        self.year = year;
        self.trunkVolume = trunkVolume;
        self.engineState = engineState;
        self.doorState = doorState;
        self.volumeState = volumeState;
        self.maxSpeed = maxSpeed;
        self.power = power;
    }
    
}

extension SportCar: CustomStringConvertible{
    var description: String {
        return "Brand: \(brand) Year: \(year) TrunkVolume: \(trunkVolume) EngineState: \(engineState) DoorState: \(doorState) VolumeState: \(volumeState) MaxSpeed: \(maxSpeed) Power: \(power)";
    }
    
    
}


var mers = SportCar(brand: "mersede", year: 2019, trunkVolume: 200, engineState: .stop, doorState: .close, volumeState: .full, maxSpeed: 320, power: 612);

mers.changeDoorState(state: .open);
mers.changeEngineState(state: .start);

print(mers);

var scania = TrunkCar(brand: "Scania", year: 2011, trunkVolume: 1000, engineState: .start, doorState: .open, volumeState: .empty, destination: "Moscow")

scania.changeDoorState(state: .close);

print(scania);
