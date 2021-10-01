//
//  main.swift
//  Homeworks
//
//  Created by Daniil on 01.10.2021.
//

import Foundation

//MARK: - Экзамен

struct Gear {
    let isEarpiecePresent: Bool
    let isCheatSheetPresent: Bool
    let isPhonePresent: Bool
}

enum ExamFaliure: Error {
    case forgotEarpiece
    case forgotCheatSheet
    case forgotPhone
    case studentDidntShowUp
}

class Exam {
    let classroom = ["Даня": Gear(isEarpiecePresent: true, isCheatSheetPresent: true, isPhonePresent: false),
                     "Даша": Gear(isEarpiecePresent: true, isCheatSheetPresent: true, isPhonePresent: true),
                     "Олег": Gear(isEarpiecePresent: false, isCheatSheetPresent: true, isPhonePresent: true)]

    func passExam (_ studentName: String) throws {
        guard let student = classroom[studentName] else {
            throw ExamFaliure.studentDidntShowUp
        }
        guard student.isCheatSheetPresent else {
            throw ExamFaliure.forgotCheatSheet
        }
        guard student.isEarpiecePresent else {
            throw ExamFaliure.forgotEarpiece
        }
        guard student.isPhonePresent else {
            throw ExamFaliure.forgotPhone
        }

        print("Студент \(studentName) успешно сдал экзамен!")
    }
}

let linearAlgebra = Exam()

do {
    try linearAlgebra.passExam("Даня")
} catch ExamFaliure.studentDidntShowUp {
    print("Студент не явился на экзамен!")
} catch ExamFaliure.forgotCheatSheet {
    print("Студент забыл шпаргалку!")
} catch ExamFaliure.forgotEarpiece {
    print("Студент забыл микронаушник!")
} catch ExamFaliure.forgotPhone {
    print("Студент забыл телефон!")
}

do {
    try linearAlgebra.passExam("Даша")
} catch ExamFaliure.studentDidntShowUp {
    print("Студент не явился на экзамен!")
} catch ExamFaliure.forgotCheatSheet {
    print("Студент забыл шпаргалку!")
} catch ExamFaliure.forgotEarpiece {
    print("Студент забыл микронаушник!")
} catch ExamFaliure.forgotPhone {
    print("Студент забыл телефон!")
}

do {
    try linearAlgebra.passExam("Федя")
} catch ExamFaliure.studentDidntShowUp {
    print("Студент не явился на экзамен!")
} catch ExamFaliure.forgotCheatSheet {
    print("Студент забыл шпаргалку!")
} catch ExamFaliure.forgotEarpiece {
    print("Студент забыл микронаушник!")
} catch ExamFaliure.forgotPhone {
    print("Студент забыл телефон!")
}

print("\n")
//MARK: - Экспедиция

struct Equipment {
    let isCompassPresent: Bool
    let isTentPresent: Bool
    let isSleepingBagPresent: Bool
}

enum CasesOfDeath: Error {
    case forgotCompass
    case forgotSleepingBag
    case forgotTent
    case didntParticipate
}

class Expedition {
    let crew = ["Даня": Equipment(isCompassPresent: true, isTentPresent: true, isSleepingBagPresent: true),
                "Даша": Equipment(isCompassPresent: true, isTentPresent: false, isSleepingBagPresent: true),
                "Олег": Equipment(isCompassPresent: false, isTentPresent: true, isSleepingBagPresent: true),
                "Федя": Equipment(isCompassPresent: true, isTentPresent: true, isSleepingBagPresent: false)]

    func showCrewMemberAchievement (_ name: String) -> (String?, CasesOfDeath?) {
        guard let crewMember = crew[name] else {
            return (nil, CasesOfDeath.didntParticipate)
        }
        guard crewMember.isCompassPresent else {
            return (nil, CasesOfDeath.forgotCompass)
        }
        guard crewMember.isSleepingBagPresent else {
            return (nil, CasesOfDeath.forgotSleepingBag)
        }
        guard crewMember.isTentPresent else {
            return (nil, CasesOfDeath.forgotTent)
        }

        return ("\(name) успешно исследовал отдаленные уголки тайги", nil)
    }
}

let taiga = Expedition()

print(taiga.showCrewMemberAchievement("Даня"))
print(taiga.showCrewMemberAchievement("Даша"))
print(taiga.showCrewMemberAchievement("Олег"))
print(taiga.showCrewMemberAchievement("Федя"))
print(taiga.showCrewMemberAchievement("Вова"))
