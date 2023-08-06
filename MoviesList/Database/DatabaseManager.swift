//
//  DatabaseManager.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 6/8/2023.
//

import Foundation
import UIKit
import CoreData

class DatabaseManger {
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func addFavorite(_ favorite: FavoriteModel){
                
        let favoriteEntity = MoviesEntity(context: context)

        favoriteEntity.movie_title = favorite.movie_title
        favoriteEntity.release_date = favorite.release_date
        favoriteEntity.poster_path = favorite.poster_path
        favoriteEntity.movie_rating = favorite.rating_average
        
        do  {
            try context.save()
        }catch  {
            print("Saving Error", error)
        }
        
        
    }
    
    
    func fetchFavorites() -> [MoviesEntity]{
        var favorites: [MoviesEntity] = []
        
        do{
           favorites = try context.fetch(MoviesEntity.fetchRequest())
        }catch{
            print("Favorites fetch error", error)
        }
        return favorites
    }
}



