//
//  DataService.swift
//  Recipe List App
//
//  Created by Zak Mellor on 14/05/2023.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Get url object
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            // Get data object
            let data = try Data(contentsOf: url)
            
            // Decode data with json decoder
            let decoder = JSONDecoder()
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the array of recipes
                return recipeData

            } catch {
                
                print(error)
            }
            
        } catch {
            
            print(error)
        }
        
        return [Recipe]()
        

    }
}
