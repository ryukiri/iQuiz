//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/20/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    var details : [String] = [""]
    var questions : [CategoryQuizInfo] = [CategoryQuizInfo]()
    var questionNumber : Int?
    var categoryNumber : Int?
    var correctNumber : Int?
    var chosenAnswer : Int = -1
    var questionRight : Int?
    var isCorrect : Bool = false
    var link: String = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[categoryNumber!].questions[questionNumber!].text
        answer1Button.setTitle(questions[categoryNumber!].questions[questionNumber!].answers[0], for: .normal)
        answer2Button.setTitle(questions[categoryNumber!].questions[questionNumber!].answers[1], for: .normal)
        answer3Button.setTitle(questions[categoryNumber!].questions[questionNumber!].answers[2], for: .normal)
        answer4Button.setTitle(questions[categoryNumber!].questions[questionNumber!].answers[3], for: .normal)
        questionRight = Int(questions[categoryNumber!].questions[questionNumber!].answer)!
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
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
    
    @IBAction func button1Action(_ sender: Any) {
        chosenAnswer = 1
        answer1Button.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        answer1Button.setTitleColor(UIColor.white, for: .normal)
        answer2Button.backgroundColor = UIColor.white
        answer2Button.setTitleColor(UIColor.blue, for: .normal)
        answer3Button.backgroundColor = UIColor.white
        answer3Button.setTitleColor(UIColor.blue, for: .normal)
        answer4Button.backgroundColor = UIColor.white
        answer4Button.setTitleColor(UIColor.blue, for: .normal)
    }
    
    @IBAction func button2Action(_ sender: Any) {
        chosenAnswer = 2
        answer2Button.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        answer2Button.setTitleColor(UIColor.white, for: .normal)
        answer1Button.backgroundColor = UIColor.white
        answer1Button.setTitleColor(UIColor.blue, for: .normal)
        answer3Button.backgroundColor = UIColor.white
        answer3Button.setTitleColor(UIColor.blue, for: .normal)
        answer4Button.backgroundColor = UIColor.white
        answer4Button.setTitleColor(UIColor.blue, for: .normal)
        
    }
    
    @IBAction func button3Action(_ sender: Any) {
        chosenAnswer = 3
        answer3Button.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        answer3Button.setTitleColor(UIColor.white, for: .normal)
        answer2Button.backgroundColor = UIColor.white
        answer2Button.setTitleColor(UIColor.blue, for: .normal)
        answer1Button.backgroundColor = UIColor.white
        answer1Button.setTitleColor(UIColor.blue, for: .normal)
        answer4Button.backgroundColor = UIColor.white
        answer4Button.setTitleColor(UIColor.blue, for: .normal)
    }
    
    @IBAction func button4Action(_ sender: Any) {
        chosenAnswer = 4
        answer4Button.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        answer4Button.setTitleColor(UIColor.white, for: .normal)
        answer2Button.backgroundColor = UIColor.white
        answer2Button.setTitleColor(UIColor.blue, for: .normal)
        answer3Button.backgroundColor = UIColor.white
        answer3Button.setTitleColor(UIColor.blue, for: .normal)
        answer1Button.backgroundColor = UIColor.white
        answer1Button.setTitleColor(UIColor.blue, for: .normal)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if chosenAnswer == -1 {
            let alert = UIAlertController(title: "No Selection", message: "Please select an answer to continue.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            let answerVC = self.storyboard?.instantiateViewController(withIdentifier: "answers") as! AnswerViewController
            answerVC.answer = questions[categoryNumber!].questions[questionNumber!].answers[questionRight! - 1]
            answerVC.question = questionLabel.text!
            if questionRight == chosenAnswer {
                isCorrect = true
                correctNumber = correctNumber! + 1
            }
            answerVC.categoryNumber = categoryNumber
            answerVC.isCorrect = isCorrect
            answerVC.correctNumber = correctNumber!
            answerVC.questionNumber = questionNumber!
            answerVC.questions = questions
            self.present(answerVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        questionNumber = 0
        categoryNumber = 0
        let myVC = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(myVC, animated: true, completion: nil)
    }
    
    @IBOutlet var swipe: UISwipeGestureRecognizer!
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped right")
                if chosenAnswer == -1 {
                    let alert = UIAlertController(title: "No Selection", message: "Please select an answer to continue.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let answerVC = self.storyboard?.instantiateViewController(withIdentifier: "answers") as! AnswerViewController
                    answerVC.answer = questions[categoryNumber!].questions[questionNumber!].answers[questionRight! - 1]
                    answerVC.question = questionLabel.text!
                    if questionRight == chosenAnswer {
                        isCorrect = true
                        correctNumber = correctNumber! + 1
                    }
                    answerVC.categoryNumber = categoryNumber
                    answerVC.isCorrect = isCorrect
                    answerVC.correctNumber = correctNumber!
                    answerVC.questionNumber = questionNumber!
                    answerVC.questions = questions
                    self.present(answerVC, animated: true, completion: nil)
                }
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped left")
                questionNumber = 0
                categoryNumber = 0
                let myVC = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
                self.present(myVC, animated: true, completion: nil)
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
}
