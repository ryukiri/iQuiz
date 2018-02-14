//
//  scienceQuestionsRepository.swift
//  iQuiz
//
//  Created by Austin Quach on 2/14/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import Foundation

class ScienceRepository {
    static let shared = ScienceRepository()
    
    private let questions : [Questions] = [
        Questions(name: "What kind of waves are present during an earthquake?"),
        Questions(name: "What is it called when light changes direction after leaving a lens?"),
        Questions(name: "How long does it take for the caffeine in coffee to fully kick in?"),
        Questions(name: "How long did it take New Horizons to reach Pluto?"),
        Questions(name: "Which of these is NOT found in an animal cell?"),
        Questions(name: "How far is the moon away from Earth?")
    ]
    
    func getQuestions() -> [Questions] {
        return questions
    }
    
    func getQuestions(id: Int) -> Questions {
        return questions[id]
    }
}
