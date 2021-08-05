//
//  IndervidualInformationController.swift
//  ApplicationD
//
//  Created by Andrew Cumming on 05/08/2021.
//

import Foundation

class IndervidualInformationController: TMDB, ObservableObject {
    
    @Published var changeStateAlert = false
    
    enum newState {
        case addNew
        case removeExisting
        case markAsWatched
    }
    
    enum previousState {
        case new
        case exisitingWatch
        case exisitingWatched
        case exisitingSuggestion
    }
    
    
    // MARK:- ChangeFilmStatus
    
    func changeFilmStatus(previousState: previousState, newState: newState, movieId: Int, completionHandler: @escaping (Bool) -> Void) {
        // Add New Film
        if previousState == .new && newState == .addNew {
            print("Adding New Film")
            let watchListId = UserDefaults.standard.integer(forKey: "watchID")
            super.addMovieToList(listID: watchListId, movieID: movieId) { (responce) in
                if responce == true {
                    self.changeStateAlert = false
                    completionHandler(true)
                }
            }
        }
        // Remove Film
        if previousState == .exisitingWatch && newState == .removeExisting {
            print("Removing Exising Film")
            let watchListId = UserDefaults.standard.integer(forKey: "watchID")
            super.removeMovieFromList(listID: watchListId, movieID: movieId) { (responce) in
                if responce == true {
                    self.changeStateAlert = false
                    completionHandler(true)
                }
            }
            
        }
        // Mark as Watched, Remove from Watch List, then Add to Watched
        if previousState == .exisitingWatch && newState == .markAsWatched {
            print("Marking film as Watched")
            let watchListId = UserDefaults.standard.integer(forKey: "watchID")
            super.removeMovieFromList(listID: watchListId, movieID: movieId) { (responce) in
                if responce == true {
                    print("movie removed")
                    let watchListId = UserDefaults.standard.integer(forKey: "watchedID")
                    super.addMovieToList(listID: watchListId, movieID: movieId) { (responce) in
                        if responce == true {
                            print("movie added to Watched")
                            self.changeStateAlert = false
                            completionHandler(true)
                        }
                    }
                }
            }
            
            
        }
    }
    
    // MARK: AddToWatch
    
    private func addToWatchList() {
        
    }
    
    // MARK: RemoveFromWatch
    
    private func removeFromWatchList() {
        
    }
    
    // MARK: MarkAsWatched
    
    private func markAsWatched() {
        
    }
    
}
