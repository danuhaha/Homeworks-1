//
//  main.swift
//  Homeworks
//
//  Created by Daniil on 11.09.2021.
//

import Foundation

enum Action{
    case turnEngineOn
    case turnEngineOff
    case rollWindowsUp
    case rollWindowsDown
    case loadFiveLitres
    case unloadFiveLitres
    case loadTenLitres
    case unloadTenLitres
}

struct SportCar {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var takenTrunkVolume: Double
    var isEngingeRunning: Bool
    var areWindowsDown: Bool

    mutating func performAction(_ action: Action) {
        switch action{
        case .turnEngineOn:
            isEngingeRunning = true
        case .turnEngineOff:
            isEngingeRunning = false
        case .rollWindowsDown:
            areWindowsDown = true
        case .rollWindowsUp:
            areWindowsDown = false
        case .loadFiveLitres:
            if takenTrunkVolume + 5 <= trunkVolume {
                takenTrunkVolume += 5
            } else {
                print("В багажник не поместятся все 5 литров, можно погрузить лишь \(trunkVolume-takenTrunkVolume)")
                takenTrunkVolume = trunkVolume
            }
        case .unloadFiveLitres:
            if takenTrunkVolume - 5 >= 0 {
                takenTrunkVolume -= 5
            } else {
                print("В багажнике нет 5 литров груза, можно выгрузить лишь \(takenTrunkVolume)")
                takenTrunkVolume = 0
            }
        default:
            print("Это легковушка, а не грузовик")
        }
    }
}

struct TrunkCar {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var takenTrunkVolume: Double
    var isEngingeRunning: Bool
    var areWindowsDown: Bool

    mutating func performAction(_ action: Action) {
        switch action{
        case .turnEngineOn:
            isEngingeRunning = true
        case .turnEngineOff:
            isEngingeRunning = false
        case .rollWindowsDown:
            areWindowsDown = true
        case .rollWindowsUp:
            areWindowsDown = false
        case .loadTenLitres:
            if takenTrunkVolume + 10 <= trunkVolume {
                takenTrunkVolume += 10
            } else {
                print("В кузов не поместятся все 10 литров, можно погрузить лишь \(trunkVolume-takenTrunkVolume)")
                takenTrunkVolume = trunkVolume
            }
        case .unloadTenLitres:
            if takenTrunkVolume - 10 >= 0 {
                takenTrunkVolume -= 10
            } else {
                print("В кузове нет 10 литров груза, можно выгрузить лишь \(takenTrunkVolume)")
                takenTrunkVolume = 0
            }
        default:
            print("Это грузовик, а не легковушка")
        }
    }
}

var carOne = SportCar(brand: "Лада", year: 1986, trunkVolume: 10.3, takenTrunkVolume: 5, isEngingeRunning: false, areWindowsDown: false)

carOne.performAction(Action.loadFiveLitres)
print(carOne.brand)
print(carOne.takenTrunkVolume)

print("\n")

var carTwo = SportCar(brand: "Lamborghini", year: 2018, trunkVolume: 5.2, takenTrunkVolume: 3, isEngingeRunning: true, areWindowsDown: true)

carTwo.performAction(Action.loadFiveLitres)
carTwo.performAction(Action.rollWindowsUp)
print(carTwo.takenTrunkVolume)
carTwo.areWindowsDown ? print("У \(carTwo.brand) открыты окна") : print("У \(carTwo.brand) закрыты окна")

print("\n")

var truckOne = TrunkCar(brand: "Газель", year: 1994, trunkVolume: 85, takenTrunkVolume: 9, isEngingeRunning: true, areWindowsDown: false)

truckOne.performAction(Action.unloadTenLitres)
print(truckOne.brand)
print(truckOne.year)
print(truckOne.takenTrunkVolume)

print("\n")

var truckTwo = TrunkCar(brand: "Камаз", year: 1991, trunkVolume: 67.7, takenTrunkVolume: 50.2, isEngingeRunning: true, areWindowsDown: false)

truckTwo.performAction(Action.loadFiveLitres)
truckTwo.performAction(Action.loadTenLitres)
print(truckTwo.takenTrunkVolume)

