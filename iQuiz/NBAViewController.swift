//
//  NBAViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/13/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class NBAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nbaQuestions = (UIApplication.shared.delegate as! AppDelegate).nbaRepository.getQuestions()
        let question = nbaQuestions![questionNumber]
        QuestionLabel.text = question.name
        loadAnswerChoices()
        loadCorrectAnswers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var questionNumber = 0;
    let nbaQuestionRepo = NBARepository.shared
    var nbaQuestions : [Questions]? = nil
    var correctAnswer = 1;
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func button1Action(_ sender: Any) {
        if correctAnswer == 1 {
            NSLog("You are correct.")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "nbaAnswers")
            self.present(vc!, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func button2Action(_ sender: Any) {
        if correctAnswer == 2 {
            NSLog("You are correct.")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "nbaAnswers")
            self.present(vc!, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func button3Action(_ sender: Any) {
        if correctAnswer == 3 {
            NSLog("You are correct.")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "nbaAnswers")
            self.present(vc!, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func button4Action(_ sender: Any) {
        if correctAnswer == 4 {
            NSLog("You are correct.")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "nbaAnswers")
            self.present(vc!, animated: true, completion: nil)
        } else {
            
        }
    }
    
    func loadAnswerChoices() {
        switch questionNumber {
        case 0:
            button1.setTitle("Kevin Durant", for: .normal)
            button2.setTitle("Lebron James", for: .normal)
            button3.setTitle("Chris Paul", for: .normal)
            button4.setTitle("Carmelo Anthony", for: .normal)
        case 1:
            button1.setTitle("31.6", for: .normal)
            button2.setTitle("33.1", for: .normal)
            button3.setTitle("32.6", for: .normal)
            button4.setTitle("36.2", for: .normal)
        case 2:
            print("Answer 1")
        case 3:
            print("Answer 1")
        case 4:
            print("Answer 1")
        default:
            print("Default")
        }
    }
    
    func loadCorrectAnswers() {
        switch questionNumber {
        case 0:
            correctAnswer = 3
        case 1:
            correctAnswer = 1
        case 2:
            print("Answer 1")
        case 3:
            print("Answer 1")
        case 4:
            print("Answer 1")
        default:
            print("Default")
        }
    }
    

}
