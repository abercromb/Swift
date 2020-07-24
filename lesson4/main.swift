//
//  main.swift
//  lesson4
//
//  Created by Vladislav Elkin on 23.07.2020.
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

class AbstractCar {
      let brand: String;
      let year: Int;
      let trunkVolume: Double;
      var engineState: EngineState;
      var doorState: DoorState;
      var volumeState: VolumeState;
    
    init(brand: String, year: Int, trunkVolume: Double, engineState: EngineState, doorState: DoorState, volumeState: VolumeState) {
        self.brand = brand;
        self.year = year;
        self.trunkVolume = trunkVolume;
        self.engineState = engineState;
        self.doorState = doorState;
        self.volumeState = volumeState;
    }
    
    func changeDoorState (state: DoorState){
        self.doorState = state;
    }
    
    func changeEngineState(state: EngineState){
        self.engineState = state;
    }
    
    func changeVolume(action: VolumeAction, count: Double){
        switch action {
        case .add:
            
            if volumeState == .full {
                print("Trunk is full");
            } else {
                if count >= trunkVolume {
                    volumeState = .full;
                    print("All added, Trunk is full");
                }else {
                    print("Added: \(count)");
                }
            }
            
            
        case .get:
            
            if volumeState == .empty {
                print("Trunk is empty");
            } else {
                
                if count >= trunkVolume {
                    volumeState = .empty;
                    print("Trunk is empty");
                }else {
                    print("Get: \(count)");
                }
            }
            
        }
  }
    
    func toString(){
        print("Brand: \(brand) Year: \(year) TrunkVolume: \(trunkVolume) EngineState: \(engineState) DoorState: \(doorState) VolumeState: \(volumeState)")
    }
}


class TrunkCar: AbstractCar {
    var destination: String;
    
    init(brand: String, year: Int, trunkVolume: Double, engineState: EngineState, doorState: DoorState, volumeState: VolumeState, destination: String) {
        self.destination = destination;
        super.init(brand: brand, year: year, trunkVolume: trunkVolume, engineState: engineState, doorState: doorState, volumeState: volumeState)
    }
    
    override func toString() {
        super.toString()
        print("Destination: \(destination)")
    }
}

class SportCar: AbstractCar {
    var maxSpeed: Int;
    var power: Int;
    
    
    init(brand: String, year: Int, trunkVolume: Double, engineState: EngineState, doorState: DoorState, volumeState: VolumeState, maxSpeed: Int, power: Int) {
        self.maxSpeed = maxSpeed;
        self.power = power;
        super.init(brand: brand, year: year, trunkVolume: trunkVolume, engineState: engineState, doorState: doorState, volumeState: volumeState)
        
    }
    
    override func toString() {
        super.toString()
        print("MaxSpeed: \(maxSpeed) Power: \(power)")
    }
    
}

var mers = SportCar(brand: "mersede", year: 2019, trunkVolume: 200, engineState: .stop, doorState: .close, volumeState: .full, maxSpeed: 320, power: 612)

mers.changeDoorState(state: .open);
mers.changeEngineState(state: .start);
mers.toString()

var scania = TrunkCar(brand: "Scania", year: 2011, trunkVolume: 1000, engineState: .start, doorState: .open, volumeState: .empty, destination: "Moscow")

scania.changeDoorState(state: .close);
scania.toString()
