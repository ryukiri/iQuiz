//
//  MovieQuestionsRepository.swift
//  iQuiz
//
//  Created by Austin Quach on 2/14/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import Foundation

class MovieRepository {
    static let shared = MovieRepository()
    
    private let questions : [Questions] = [
        Questions(name: "In how many languages is C-3PO fluent?"),
        Questions(name: "Who was the original commander of the Death Star?"),
        Questions(name: "Who was Bambi's best friend?"),
        Questions(name: "What footwear was Anna wearing throughout most of the movie?"),
        Questions(name: "What happened to Tiana's father?"),
        Questions(name: " \"Whatever just happened, blame it on the pig.\" is said by:")
    ]
    
    func getQuestions() -> [Questions] {
        return questions
    }
    
    func getQuestions(id: Int) -> Questions {
        return questions[id]
    }
}

