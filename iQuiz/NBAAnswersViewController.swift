//
//  NBAAnswersViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/13/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class NBAAnswersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = labelText
        numberRight.text = "\(String(correct)) / \(String(questionNumber+1))"
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

    var questionNumber : Int = Int()
    var category : String = String()
    @IBOutlet weak var label: UILabel!
    var labelText : String = String()
    @IBOutlet weak var numberRight: UILabel!
    var correct : Int = Int()
    
    @IBAction func next(_ sender: Any) {
        questionNumber = questionNumber + 1
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "nbaQuestions") as! NBAViewController
        myVC.questionNumber = questionNumber
        myVC.category = category
        myVC.correct = correct
        self.present(myVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! NBAViewController
        vc.questionNumber = questionNumber
    }
}
