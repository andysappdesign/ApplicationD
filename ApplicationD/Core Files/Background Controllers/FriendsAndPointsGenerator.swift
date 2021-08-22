//
//  FriendsAndPointsGenerator.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 17/08/2021.
//
//  This class can create fake Friend Names and ratings from a pre-defined dictoionairy 

import Foundation

class FriendsAndPointsGenerator {
    
    
    func generateFriends(howMany: Int) -> [String] {
        let namesList = ["Robin", "Flynn", "Beaker", "Mantis", "Maria"]
        var randomName = "Naveen"
        var generatedNames: [String] = []
        var pickedNames: [String] = ["Naveen"]
        for _ in 1...howMany {
            while pickedNames.contains(randomName) {
                randomName = namesList.randomElement()!
            }
            pickedNames.append(randomName)
            generatedNames.append(randomName)
        }
        return generatedNames
        
    }
    
    func generateReviewScore() -> [Double] {
        let scorelist = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
        let randomScores = [scorelist.randomElement()!, scorelist.randomElement()!]
        return randomScores
    }
    
    
    
}
