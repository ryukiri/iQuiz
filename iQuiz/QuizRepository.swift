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
    
    private let categories : [Category] = [
        Category(name: "NBA"),
        Category(name: "Science"),
        Category(name: "Music"),
        Category(name: "Mathematics")
    ]
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getCategory(id: Int) -> Category {
        return categories[id]
    }
}
