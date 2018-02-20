//
//  EndViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/20/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    @IBOutlet weak var finalScoreLabel: UILabel!
    var questionNumber: Int = -1
    var correctNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = "\(correctNumber) / \(questionNumber)"
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

    @IBAction func startOverButton(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(myVC, animated: true, completion: nil)
    }
}
