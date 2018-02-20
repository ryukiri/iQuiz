//
//  QuizRepository.swift
//  iQuiz
//
//  Created by Austin Quach on 2/10/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import Foundation

class Category {
    init(name : String) {
        self.name = name
    }
    var name = ""
}

class QuizRepository {
    // Create
    // Retrieve
    // Update
    // Delete
    
    static let shared = QuizRepository()
    
    public var categories : [Category] = [
        /*Category(name: "NBA"),
        Category(name: "Science"),
        Category(name: "Music"),
        Category(name: "Movies")*/
    ]
    
    func addCategories(category: String) {
        categories.append( Category(name: category) )
        //print(categories)
    }
    
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getCategory(id: Int) -> Category {
        return categories[id]
    }
}
