//
//  NBAViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/13/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class NBAViewController: UIViewController {
    var questionText : String = String()
    var answerText : String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        QuestionLabel.lineBreakMode = .byWordWrapping
        QuestionLabel.numberOfLines = 0
        
        if category == "NBA" {
            nbaQuestions = (UIApplication.shared.delegate as! AppDelegate).nbaRepository.getQuestions()
            var question = nbaQuestions![0]
            if (questionNumber < (nbaQuestions?.count)!) {
                question = nbaQuestions![questionNumber]
                QuestionLabel.text = question.name
                questionText = question.name
            } else {
                QuestionLabel.text = ""
            }
        } else if category == "Movies" {
            nbaQuestions = (UIApplication.shared.delegate as! AppDelegate).movieRepository.getQuestions()
            var question = nbaQuestions![0]
            if (questionNumber < (nbaQuestions?.count)!) {
                question = nbaQuestions![questionNumber]
                QuestionLabel.text = question.name
            } else {
                QuestionLabel.text = ""
            }
        } else if category == "Music" {
            nbaQuestions = (UIApplication.shared.delegate as! AppDelegate).musicRepository.getQuestions()
            var question = nbaQuestions![0]
            if (questionNumber < (nbaQuestions?.count)!) {
                question = nbaQuestions![questionNumber]
                QuestionLabel.text = question.name
            } else {
                QuestionLabel.text = ""
            }
        } else if category == "Science" {
            nbaQuestions = (UIApplication.shared.delegate as! AppDelegate).scienceRepository.getQuestions()
            var question = nbaQuestions![0]
            if (questionNumber < (nbaQuestions?.count)!) {
                question = nbaQuestions![questionNumber]
                QuestionLabel.text = question.name
            } else {
                QuestionLabel.text = ""
            }
        }
        
        loadAnswerChoices()
        loadCorrectAnswers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    var questionNumber : Int = Int()
    let nbaQuestionRepo = NBARepository.shared
    var nbaQuestions : [Questions]? = nil
    var correctAnswer = 1;
    var category : String = String()
    var correct = 0;
    var rightWrong = 0;
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func button1Action(_ sender: Any) {
        button1.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        button1.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = UIColor.white
        button2.setTitleColor(UIColor.blue, for: .normal)
        button3.backgroundColor = UIColor.white
        button3.setTitleColor(UIColor.blue, for: .normal)
        button4.backgroundColor = UIColor.white
        button4.setTitleColor(UIColor.blue, for: .normal)
        if correctAnswer == 1 {
            NSLog("You are correct.")
            rightWrong = 1
        } else {
            NSLog("You are not correct.")
            rightWrong = 0
        }
    }
    
    @IBAction func button2Action(_ sender: Any) {
        button2.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        button2.setTitleColor(UIColor.white, for: .normal)
        button1.backgroundColor = UIColor.white
        button1.setTitleColor(UIColor.blue, for: .normal)
        button3.backgroundColor = UIColor.white
        button3.setTitleColor(UIColor.blue, for: .normal)
        button4.backgroundColor = UIColor.white
        button4.setTitleColor(UIColor.blue, for: .normal)
        if correctAnswer == 2 {
            NSLog("You are correct.")
            rightWrong = 1
        } else {
            NSLog("You are not correct.")
            rightWrong = 0
        }
    }
    
    @IBAction func button3Action(_ sender: Any) {
        button3.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        button3.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = UIColor.white
        button2.setTitleColor(UIColor.blue, for: .normal)
        button1.backgroundColor = UIColor.white
        button1.setTitleColor(UIColor.blue, for: .normal)
        button4.backgroundColor = UIColor.white
        button4.setTitleColor(UIColor.blue, for: .normal)
        if correctAnswer == 3 {
            NSLog("You are correct.")
            rightWrong = 1
        } else {
            NSLog("You are not correct.")
            rightWrong = 0
        }
    }
    
    @IBAction func button4Action(_ sender: Any) {
        button4.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        button4.setTitleColor(UIColor.white, for: .normal)
        button2.backgroundColor = UIColor.white
        button2.setTitleColor(UIColor.blue, for: .normal)
        button3.backgroundColor = UIColor.white
        button3.setTitleColor(UIColor.blue, for: .normal)
        button1.backgroundColor = UIColor.white
        button1.setTitleColor(UIColor.blue, for: .normal)
        if correctAnswer == 4 {
            NSLog("You are correct.")
            rightWrong = 1
        } else {
            NSLog("You are not correct.")
            rightWrong = 0
        }
    }
    
    @IBAction func button5Action(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(myVC, animated: true, completion: nil)
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "nbaAnswers") as! NBAAnswersViewController
        if rightWrong == 0 {
            myVC.questionNumber = questionNumber
            myVC.category = category
            myVC.correct = correct
            myVC.questionText = questionText
            myVC.answerText = answerText
            myVC.labelText = "Incorrect"
        } else if rightWrong == 1 {
            correct += 1
            myVC.correct = correct
            myVC.questionText = questionText
            myVC.questionNumber = questionNumber
            myVC.answerText = answerText
            myVC.category = category
            myVC.labelText = "Correct"
        }
        self.present(myVC, animated: true, completion: nil)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        questionNumber = 0
        correct = 0
        let myVC = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(myVC, animated: true, completion: nil)
    }
    
    func loadAnswerChoices() {
        if category == "NBA" {
            switch questionNumber {
            case 0:
                button1.setTitle("Kevin Durant", for: .normal)
                button2.setTitle("Lebron James", for: .normal)
                button3.setTitle("Chris Paul", for: .normal)
                button4.setTitle("Carmelo Anthony", for: .normal)
                answerText = "Chris Paul"
            case 1:
                button1.setTitle("31.6", for: .normal)
                button2.setTitle("33.1", for: .normal)
                button3.setTitle("32.6", for: .normal)
                button4.setTitle("36.2", for: .normal)
                answerText = "31.6"
            case 2:
                button1.setTitle("Stephen Curry", for: .normal)
                button2.setTitle("Kobe Bryant", for: .normal)
                button3.setTitle("Ray Allen", for: .normal)
                button4.setTitle("Steve Nash", for: .normal)
                answerText = "Steve Nash"
            case 3:
                button1.setTitle("16", for: .normal)
                button2.setTitle("12", for: .normal)
                button3.setTitle("15", for: .normal)
                button4.setTitle("18", for: .normal)
                answerText = "16"
            case 4:
                button1.setTitle("Markelle Fultz. Phoenix Suns.", for: .normal)
                button2.setTitle("Markelle Fultz. Minnesota Timberwolves.", for: .normal)
                button3.setTitle("Markelle Fultz. Boston Celtics.", for: .normal)
                button4.setTitle("Markelle Fultz. Philidelphia 76ers.", for: .normal)
                answerText = "Markelle Fultz. Philidelphia 76ers."
            case 5:
                button1.setTitle("Lebron James. 20 years, 10 days.", for: .normal)
                button2.setTitle("Lonzo Ball. 20 years, 15 days.", for: .normal)
                button3.setTitle("Magic Johnson. 19 years, 289 days.", for: .normal)
                button4.setTitle("Kobe Bryant. 18 years, 343 days.", for: .normal)
                answerText = "Lonzo Ball. 20 years, 15 days."
            default:
                QuestionLabel.text = "Game ended."
                scoreLabel.text = "Your score is: \(correct) / \(questionNumber + 1)"
                scoreLabel.isHidden = false
                questionNumber = 0
                correct = 0
                button1.isHidden = true
                button2.isHidden = true
                button3.isHidden = true
                button4.isHidden = true
                button5.isHidden = false
                submitButton.isHidden = true
            }
        } else if category == "Movies" {
            switch questionNumber {
            case 0:
                button1.setTitle("Over 6 million", for: .normal)
                button2.setTitle("4", for: .normal)
                button3.setTitle("Roughly 12 million", for: .normal)
                button4.setTitle("8 million", for: .normal)
                answerText = "Over 6 million"
            case 1:
                button1.setTitle("Grand Moff Tarkin", for: .normal)
                button2.setTitle("Admiral Motti", for: .normal)
                button3.setTitle("Grand Admiral Thrawn", for: .normal)
                button4.setTitle("Orson Krennic", for: .normal)
                answerText = "Grand Moff Tarkin"
            case 2:
                button1.setTitle("Hopper", for: .normal)
                button2.setTitle("Jumper", for: .normal)
                button3.setTitle("Thumper", for: .normal)
                button4.setTitle("Humper", for: .normal)
                answerText = "Thumper"
            case 3:
                button1.setTitle("Heels", for: .normal)
                button2.setTitle("Boots", for: .normal)
                button3.setTitle("Sandals", for: .normal)
                button4.setTitle("Sneakers", for: .normal)
                answerText = "Boots"
            case 4:
                button1.setTitle("He's on a trip.", for: .normal)
                button2.setTitle("He died.", for: .normal)
                button3.setTitle("He left the family.", for: .normal)
                button4.setTitle("He is in the army.", for: .normal)
                answerText = "He died."
            case 5:
                button1.setTitle("Maui.", for: .normal)
                button2.setTitle("Gramma Tala.", for: .normal)
                button3.setTitle("Chief Tui.", for: .normal)
                button4.setTitle("Moana.", for: .normal)
                answerText = "Gramma Tala"
            default:
                QuestionLabel.text = "Game ended."
                scoreLabel.text = "Your score is: \(correct) / \(questionNumber + 1)"
                scoreLabel.isHidden = false
                questionNumber = 0
                correct = 0
                button1.isHidden = true
                button2.isHidden = true
                button3.isHidden = true
                button4.isHidden = true
                button5.isHidden = false
                submitButton.isHidden = true
            }
        } else if category == "Music" {
            switch questionNumber {
            case 0:
                button1.setTitle("J-Hope", for: .normal)
                button2.setTitle("V", for: .normal)
                button3.setTitle("RM", for: .normal)
                button4.setTitle("Suga", for: .normal)
                answerText = "RM"
            case 1:
                button1.setTitle("Ordinary Life", for: .normal)
                button2.setTitle("False Alarm", for: .normal)
                button3.setTitle("Attention", for: .normal)
                button4.setTitle("There is no 14th song.", for: .normal)
                answerText = "Ordinary Life"
            case 2:
                button1.setTitle("Seattle", for: .normal)
                button2.setTitle("Washington DC", for: .normal)
                button3.setTitle("Chicago", for: .normal)
                button4.setTitle("Los Angeles", for: .normal)
                answerText = "Washington DC"
            case 3:
                button1.setTitle("Illenium", for: .normal)
                button2.setTitle("Marshmello", for: .normal)
                button3.setTitle("Porter Robinson", for: .normal)
                button4.setTitle("Tritonal", for: .normal)
                answerText = "Tritonal"
            case 4:
                button1.setTitle("15", for: .normal)
                button2.setTitle("8", for: .normal)
                button3.setTitle("13", for: .normal)
                button4.setTitle("11", for: .normal)
                answerText = "11"
            case 5:
                button1.setTitle("Variation IX", for: .normal)
                button2.setTitle("Variation I", for: .normal)
                button3.setTitle("Variation XI", for: .normal)
                button4.setTitle("Variation XII", for: .normal)
                answerText = "Variation XI"
            default:
                QuestionLabel.text = "Game ended."
                scoreLabel.text = "Your score is: \(correct) / \(questionNumber + 1)"
                scoreLabel.isHidden = false
                questionNumber = 0
                correct = 0
                button1.isHidden = true
                button2.isHidden = true
                button3.isHidden = true
                button4.isHidden = true
                button5.isHidden = false
                submitButton.isHidden = true
            }
        } else if category == "Science" {
            switch questionNumber {
            case 0:
                button1.setTitle("Both transverse and longitudinal", for: .normal)
                button2.setTitle("Transverse", for: .normal)
                button3.setTitle("Longitudinal", for: .normal)
                button4.setTitle("Neither", for: .normal)
                answerText = "Both traverse and longitudinal"
            case 1:
                button1.setTitle("Refraction", for: .normal)
                button2.setTitle("Reflection", for: .normal)
                button3.setTitle("Diffraction", for: .normal)
                button4.setTitle("None of the above", for: .normal)
                answerText = "Refraction"
            case 2:
                button1.setTitle("30 mins", for: .normal)
                button2.setTitle("20 mins", for: .normal)
                button3.setTitle("15 mins", for: .normal)
                button4.setTitle("An hour", for: .normal)
                answerText = "20 mins"
            case 3:
                button1.setTitle("12 years", for: .normal)
                button2.setTitle("9 years", for: .normal)
                button3.setTitle("14 years", for: .normal)
                button4.setTitle("None of the above", for: .normal)
                answerText = "9 years"
            case 4:
                button1.setTitle("Mitochondria", for: .normal)
                button2.setTitle("Nucleus", for: .normal)
                button3.setTitle("Chloroplasts", for: .normal)
                button4.setTitle("Endoplasmic reticulum", for: .normal)
                answerText = "Chloroplasts"
            case 5:
                button1.setTitle("Around 356 100 km away", for: .normal)
                button2.setTitle("Around 376 600 km away", for: .normal)
                button3.setTitle("Around 378 200 km away", for: .normal)
                button4.setTitle("Around 372 700 km away", for: .normal)
                answerText = "Around 376 600 km away"
            default:
                QuestionLabel.text = "Game ended."
                scoreLabel.text = "Your score is: \(correct) / \(questionNumber + 1)"
                scoreLabel.isHidden = false
                questionNumber = 0
                correct = 0
                button1.isHidden = true
                button2.isHidden = true
                button3.isHidden = true
                button4.isHidden = true
                button5.isHidden = false
                submitButton.isHidden = true
            }
        }
        
    }
    
    func loadCorrectAnswers() {
        if category == "NBA" {
            switch questionNumber {
            case 0:
                correctAnswer = 3
            case 1:
                correctAnswer = 1
            case 2:
                correctAnswer = 4
            case 3:
                correctAnswer = 1
            case 4:
                correctAnswer = 4
            case 5:
                correctAnswer = 2
            default:
                correctAnswer = 5
            }
        } else if category == "Movies" {
            switch questionNumber {
            case 0:
                correctAnswer = 1
            case 1:
                correctAnswer = 1
            case 2:
                correctAnswer = 3
            case 3:
                correctAnswer = 2
            case 4:
                correctAnswer = 2
            case 5:
                correctAnswer = 2
            default:
                correctAnswer = 5
            }
        } else if category == "Music" {
            switch questionNumber {
            case 0:
                correctAnswer = 3
            case 1:
                correctAnswer = 1
            case 2:
                correctAnswer = 2
            case 3:
                correctAnswer = 4
            case 4:
                correctAnswer = 4
            case 5:
                correctAnswer = 3
            default:
                correctAnswer = 5
            }
        } else if category == "Science" {
            switch questionNumber {
            case 0:
                correctAnswer = 1
            case 1:
                correctAnswer = 1
            case 2:
                correctAnswer = 2
            case 3:
                correctAnswer = 2
            case 4:
                correctAnswer = 3
            case 5:
                correctAnswer = 2
            default:
                correctAnswer = 5
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc2 = segue.destination as! NBAAnswersViewController
        questionNumber = questionNumber + 1
        vc2.questionNumber = questionNumber
    }
}
