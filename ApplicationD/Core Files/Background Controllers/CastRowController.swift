//
//  CastRowController.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 20/07/2021.
//

import Foundation
import SwiftyJSON

class CastRowController: TMDB, ObservableObject {
    
    let movieID: Int
    var castArray: [JSON] = []
    var objectArray: [castObjects] = []
    let urlFirstHalf = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2"
    @Published var fourCastArray: [castObjects] = []
    
    @Published var firstPersonURL: String = ""
    @Published var firstPersonName: String = ""
    @Published var firstPersonCharacter: String = ""
    
    @Published var secondPersonURL: String = ""
    @Published var secondPersonName: String = ""
    @Published var secondPersonCharacter: String = ""
    
    @Published var thirdPersonURL: String = ""
    @Published var thirdPersonName: String = ""
    @Published var thirdPersonCharacter: String = ""
    
    @Published var fourthPersonURL: String = ""
    @Published var fourthPersonName: String = ""
    @Published var fourthPersonCharacter: String = ""
    
    // MARK:- init
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    // MARK:- getCast
    
    private func getCast(completionHandler: @escaping () -> Void) {
        super.getCredits(movieID: self.movieID) { (responce) in
            if responce != JSON() {
                self.castArray = responce["cast"].arrayValue
                self.getObjects()
                self.sortList()
                print("getCast completed")
                completionHandler()
                
            } else {
                print("responce is empty")
            }
        }
    }
    
    // MARK: getObject
    
    private func getObjects() {
        for i in 0..<castArray.count {
            let json = self.castArray[i]
            let object = castObjects(id: json["id"].int!, name: json["name"].string!, profilePicURL: "", cast_id: json["cast_id"].int!, character: json["character"].string!)
            self.objectArray.append(object)
        }
    }
    
    // MARK: sortList
    
    private func sortList() {
        for i in 1...4 {
            let temp = self.objectArray[i]
//            print(temp)
            self.fourCastArray.append(temp)
        }
    }
    
    // MARK:- getProfilePic
    
    private func getProfilePic(personID: Int, completionHandler: @escaping (String) -> Void) {
        super.getImagesOfPerson(personID: personID) { (responce) in
            if responce != JSON() {
                let tempArray = responce["profiles"].array!
                let object = tempArray[0]
                let path = object["file_path"].string!
                completionHandler(path)
                
            } else {
                print("responce is empty")

            }
            
        }
        
    }
    
    
    // MARK: - getNames
    
    private func getNames() {
        for i in 0...self.fourCastArray.count {
            if i == 0 {
                let temp = self.fourCastArray[i]
                self.firstPersonName = temp.name
                self.firstPersonCharacter = temp.character
                print("First Person, Name: \(self.firstPersonName), Character: \(self.firstPersonCharacter)")
            }
            if i == 1 {
                let temp = self.fourCastArray[i]
                self.secondPersonName = temp.name
                self.secondPersonCharacter = temp.character
                print("Second Person, Name: \(self.secondPersonName), Character: \(self.secondPersonCharacter)")
            }
            if i == 2 {
                let temp = self.fourCastArray[i]
                self.thirdPersonName = temp.name
                self.thirdPersonCharacter = temp.character
                print("Third Person, Name: \(self.thirdPersonName), Character: \(self.thirdPersonCharacter)")
            }
            if i == 3 {
                let temp = self.fourCastArray[i]
                self.fourthPersonName = temp.name
                self.fourthPersonCharacter = temp.character
                print("Fourth Person, Name: \(self.fourthPersonName), Character: \(self.fourthPersonCharacter)")
            }
        }
    }
    
    // MARK:- populateCastRow
    
    func populateCastRow() {
        getCast {
            self.getNames()
            for i in 0...self.fourCastArray.count {
                if i == 0 {
                    let temp = self.fourCastArray[i]
                    let id = temp.id
                    self.getProfilePic(personID: id) { (responce) in
                        self.firstPersonURL = self.urlFirstHalf + responce
                        print("firstPersonURL: \(self.firstPersonURL)")
                        
                    }
                } // end of first person
                if i == 1 {
                    let temp = self.fourCastArray[i]
                    let id = temp.id
                    self.getProfilePic(personID: id) { (responce) in
                        self.secondPersonURL = self.urlFirstHalf + responce
                        print("secondPersonURL: \(self.secondPersonURL)")
                        
                    }
                } // end of second person
                if i == 2 {
                    let temp = self.fourCastArray[i]
                    let id = temp.id
                    self.getProfilePic(personID: id) { (responce) in
                        self.thirdPersonURL = self.urlFirstHalf + responce
                        print("thirdPersonURL: \(self.thirdPersonURL)")
                        
                    }
                } // end of third person
                if i == 3 {
                    let temp = self.fourCastArray[i]
                    let id = temp.id
                    self.getProfilePic(personID: id) { (responce) in
                        self.fourthPersonURL = self.urlFirstHalf + responce
                        print("fourthPersonURL: \(self.fourthPersonURL)")
                        
                    }
                } // end of fourth person
                
            }
            
            
            
            
        }
        
    }
    
}
