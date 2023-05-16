//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Zak Mellor on 14/05/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
}
