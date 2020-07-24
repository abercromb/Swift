//
//  main.swift
//  lesson3
//
//  Created by Vladislav Elkin on 21.07.2020.
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

struct sportCar {
    let brand: String;
    let year: Int;
    let trunkVolume: Double;
    var engineState: EngineState;
    var doorState: DoorState;
    var volumeState: VolumeState;
    
    mutating func changeDoorState (state: DoorState){
        self.doorState = state;
    }
    
    mutating func changeEngineState(state: EngineState){
        self.engineState = state;
    }
    
    mutating func changeVolume(action: VolumeAction, count: Double){
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
            
            break;
            
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
            
            break;
    }
  }
}


struct truckCar {
    let brand: String;
    let year: Int;
    let trunkVolume: Double;
    var engineState: EngineState;
    var doorState: DoorState;
    var volumeState: VolumeState;
    
    mutating func changeDoorState (state: DoorState){
        self.doorState = state;
    }
    
    mutating func changeEngineState(state: EngineState){
        self.engineState = state;
    }
    
    mutating func changeVolume(action: VolumeAction, count: Double){
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
            
            break;
            
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
            
            break;
    }
  }
}

var mersedes = sportCar(brand: "mersedes", year: 2010, trunkVolume: 200, engineState: .stop, doorState: .close, volumeState: .empty);

mersedes.changeDoorState(state: .open);
mersedes.changeVolume(action: .add, count: 200);

print(mersedes);


var scania = truckCar(brand: "Scania", year: 2009, trunkVolume: 1000, engineState: .stop, doorState: .open, volumeState: .full);

scania.changeDoorState(state: .close);
scania.changeEngineState(state: .start);

print(scania);
