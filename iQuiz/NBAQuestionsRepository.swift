//
//  NBAQuestionsRepository.swift
//  iQuiz
//
//  Created by Austin Quach on 2/13/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import Foundation

class Questions {
    init(name : String) {
        self.name = name
    }
    var name = ""
}

class NBARepository {
    static let shared = NBARepository()
    
    private let questions : [Questions] = [
        Questions(name: "Who was the 2013 All-Star MVP?"),
        Questions(name: "How many points did Kobe average in 2006?"),
        Questions(name: "Who holds the highest career free throw percentage?"),
        Questions(name: "How many championships have the Los Angeles Lakers won?"),
        Questions(name: "Who was the most recent number 1 pick out of the University of Washington? And what team does he currently play on?"),
        Questions(name: "Who is the youngest player to record a triple double and how long did it take?")
    ]
    
    func getQuestions() -> [Questions] {
        return questions
    }
    
    func getQuestions(id: Int) -> Questions {
        return questions[id]
    }
}
