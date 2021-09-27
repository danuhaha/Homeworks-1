//
//  main.swift
//  Homeworks
//
//  Created by Daniil on 27.09.2021.
//

protocol Car {
    var brand: String { get set }
    var year: Int { get set }
    var trunkVolume: Double { get set }
    var takenTrunkVolume: Double { get set }
    var isEngingeRunning: Bool { get set }
    var areWindowsDown: Bool { get set }
}

extension Car {
    mutating func rollWindowsDown(){
        areWindowsDown = true
    }
    mutating func rollWindowsUp(){
        areWindowsDown = false
    }
}

extension Car {
    mutating func turnEngineOn(){
        isEngingeRunning = true
    }
    mutating func turnEngineOff(){
        isEngingeRunning = false
    }
}
extension Car {
    mutating func unloadTrunk(){
        takenTrunkVolume = 0
    }
    mutating func loadTrunk(){
        takenTrunkVolume = trunkVolume
    }
}

class SportCar: Car {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var takenTrunkVolume: Double
    var isEngingeRunning: Bool
    var areWindowsDown: Bool
    var amountOfExtraSits: Int

    init(brand: String,year: Int,trunkVolume: Double, takenTrunkVolume: Double, isEngingeRunning: Bool,
         areWindowsDown: Bool, amountOfExtraSits: Int) {
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        self.takenTrunkVolume = takenTrunkVolume
        self.isEngingeRunning = isEngingeRunning
        self.areWindowsDown = areWindowsDown
        self.amountOfExtraSits = amountOfExtraSits
    }

    convenience init(brand: String,year: Int,trunkVolume: Double, amountOfExtraSits: Int){
        self.init(brand: brand, year: year, trunkVolume: trunkVolume, takenTrunkVolume: 0, isEngingeRunning: false,                  areWindowsDown: false, amountOfExtraSits: amountOfExtraSits)
    }
}

class TrunkCar: Car {
    var brand: String
    var year: Int
    var trunkVolume: Double
    var takenTrunkVolume: Double
    var isEngingeRunning: Bool
    var areWindowsDown: Bool
    var amountOfWheels: Int

    init(brand: String,year: Int,trunkVolume: Double, takenTrunkVolume: Double, isEngingeRunning: Bool,
         areWindowsDown: Bool, amountOfWheels: Int) {
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
        self.takenTrunkVolume = takenTrunkVolume
        self.isEngingeRunning = isEngingeRunning
        self.areWindowsDown = areWindowsDown
        self.amountOfWheels = amountOfWheels
    }

    convenience init(brand: String,year: Int,trunkVolume: Double, amountOfWheels: Int){
        self.init(brand: brand, year: year, trunkVolume: trunkVolume, takenTrunkVolume: 0, isEngingeRunning: false,                  areWindowsDown: false, amountOfWheels: amountOfWheels)
    }

}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\(brand) \(year) года выпуска с объемом багажника \(trunkVolume) литров и \(amountOfExtraSits) дополнительными сиденьями"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\(brand) \(year) года выпуска с объемом кузова \(trunkVolume) литров и \(amountOfWheels) колесами в целом"
    }
}

var carOne = SportCar(brand: "Лада", year: 1986, trunkVolume: 10.3, amountOfExtraSits: 2)

print(carOne)
carOne.loadTrunk()
print("Сейчас в багажнике \(carOne.takenTrunkVolume) литров")


print("\n")

var carTwo = SportCar(brand: "Lamborghini", year: 2018, trunkVolume: 5.2, amountOfExtraSits: 0)

carTwo.rollWindowsUp()
print(carTwo)
carTwo.areWindowsDown ? print("У \(carTwo.brand) открыты окна") : print("У \(carTwo.brand) закрыты окна")

print("\n")

var truckOne = TrunkCar(brand: "Газель", year: 1994, trunkVolume: 85, takenTrunkVolume: 5.3, isEngingeRunning: false, areWindowsDown: true, amountOfWheels: 4)

print(truckOne)
truckOne.loadTrunk()
print("Сейчас в кузове у \(truckOne.brand) \(truckOne.takenTrunkVolume) литров")


