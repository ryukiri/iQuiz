//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/20/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var correctIncorectLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    var questions : [CategoryQuizInfo] = [CategoryQuizInfo]()
    var categoryNumber : Int?
    var question: String = ""
    var answer: String = ""
    var isCorrect: Bool = false
    var questionNumber: Int = -1
    var correctNumber: Int = 0
    var link: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.text = question
        answerLabel.text = answer
        if isCorrect {
            correctIncorectLabel.text = "Correct"
        } else {
            correctIncorectLabel.text = "Incorrect"
        }
        scoreLabel.text = "\(correctNumber) / \(questionNumber+1)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextButtonAction(_ sender: Any) {
        questionNumber += 1
        
        if questionNumber < questions[categoryNumber!].questions.count {
            let myVC = storyboard?.instantiateViewController(withIdentifier: "questions") as! QuestionViewController
            myVC.questionNumber = questionNumber
            myVC.correctNumber = correctNumber
            myVC.categoryNumber = categoryNumber
            myVC.questions = questions
            myVC.link = link
            self.present(myVC, animated: true, completion: nil)
            
        } else {
            let myVC = storyboard?.instantiateViewController(withIdentifier: "gameOver") as! EndViewController
            myVC.correctNumber = correctNumber
            myVC.questionNumber = questionNumber
            myVC.link = link
            self.present(myVC, animated: true, completion: nil)
        }
        
    }
    
}
