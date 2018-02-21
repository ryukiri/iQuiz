//
//  QuizRepository.swift
//  iQuiz
//
//  Created by Austin Quach on 2/19/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import Foundation

class QuizRepository {
    var categories : [String] = [String]()
    var details : [String] = [String]()
    
    func addCategories(category: String) {
        categories.append(category)
    }
    
    func getCategories() -> [String] {
        return categories
    }
    
    func getCategory(id : Int) -> String {
        return categories[id]
    }
    
    func addDetails(detail: String) {
        details.append(detail)
    }
    
    func getDetails() -> [String] {
        return details
    }
}
