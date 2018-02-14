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
        //print(questionNumber)
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
    
    @IBAction func next(_ sender: Any) {
        questionNumber = questionNumber + 1
        print(questionNumber)
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "nbaQuestions") as! NBAViewController
        myVC.questionNumber = questionNumber
        myVC.category = category
        self.present(myVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! NBAViewController
        vc.questionNumber = questionNumber
    }
}
