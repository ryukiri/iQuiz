//
//  ViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/5/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblQuizCategories: UITableView!
    let categoryRepo = QuizRepository.shared
    var categories : [Category]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        categories = (UIApplication.shared.delegate as! AppDelegate).categoryRepository.getCategories()
        tblQuizCategories.dataSource = self
        tblQuizCategories.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("numberOfRowsInSection called")
        return categories!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        NSLog("We are being asked for indexPath \(indexPath)()")
        let index = indexPath.row
        let category = categories![index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = category.name
        cell.imageView?.image = UIImage(named: "nba.png")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories![indexPath.row]
        NSLog("User selected row at \(category.name)")
        
        let alert = UIAlertController(title: "You selected", message: category.name, preferredStyle: .alert)
    }
    
    @IBAction func settings(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    

}

