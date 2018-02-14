//
//  MusicQuestionsRepository.swift
//  iQuiz
//
//  Created by Austin Quach on 2/14/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import Foundation

class MusicRepository {
    static let shared = MusicRepository()
    
    private let questions : [Questions] = [
        Questions(name: "Who is the leader of BTS?"),
        Questions(name: "What is the 14th song on the Starboy Album by The Weeknd?"),
        Questions(name: "Where was Tritonia 150 held?"),
        Questions(name: "Which of these artists did not perform at EDC 2017?"),
        Questions(name: "How many solo number 1 singles did Michael Jackson have?"),
        Questions(name: "Which of Elgar's Enigma Variations was partially inspired by a bulldog?")
    ]
    
    func getQuestions() -> [Questions] {
        return questions
    }
    
    func getQuestions(id: Int) -> Questions {
        return questions[id]
    }
}
