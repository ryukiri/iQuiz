//
//  ViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/5/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit
import Foundation

struct CategoryQuizInfo: Decodable {
    let title : String
    let desc : String
    let questions : [Question]
}

struct Question: Decodable {
    let text : String
    let answer : String
    let answers : [String]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblQuizCategories: UITableView!
    let repo = QuizRepository()
    let categoryRepo = QuizRepository.shared
    var categories : [Category]?
    var category : String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //categories = (UIApplication.shared.delegate as! AppDelegate).categoryRepository.getCategories()
        fetchJson()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // change 2 to desired number of seconds
            // Your code with delay
            self.tblQuizCategories.reloadData()
        }

        tblQuizCategories.dataSource = self
        tblQuizCategories.delegate = self
        tblQuizCategories.estimatedRowHeight = 65
        tblQuizCategories.rowHeight = UITableViewAutomaticDimension
        tblQuizCategories.numberOfRows(inSection: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //NSLog("numberOfRowsInSection called")
        return categories!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //NSLog("We are being asked for indexPath \(indexPath)()")
        fetchJson()
        let index = indexPath.row
        let category = categories![index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = category.name
        if category.name == "NBA" {
            cell.imageView?.image = UIImage(named: "nba.png")
            cell.detailTextLabel?.text = "Test your skills on NBA trivia questions!"
        } else if category.name == "Science" {
            cell.imageView?.image = UIImage(named: "science.png")
            cell.detailTextLabel?.text = "You think you can science?"
        } else if category.name == "Music" {
            cell.imageView?.image = UIImage(named: "music.png")
            cell.detailTextLabel?.text = "How big of a music fan are you?"
        } else if category.name == "Movies" {
            cell.imageView?.image = UIImage(named: "movies.ico")
            cell.detailTextLabel?.text = "Do you pay attention during movies?"
        }
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.detailTextLabel?.textColor = UIColor.purple
        cell.detailTextLabel?.font = UIFont.italicSystemFont(ofSize: 12.0)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories![indexPath.row]
        NSLog("User selected row at \(category.name)")
        
        let alert = UIAlertController(title: "You selected", message: category.name, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        if category.name == "NBA" {
            NSLog("In NBA")
            let myVC = storyboard?.instantiateViewController(withIdentifier: "nbaQuestions") as! NBAViewController
            myVC.category = "NBA"
            self.category = "NBA"
            self.present(myVC, animated: true, completion: nil)
        } else if category.name == "Science" {
            NSLog("In Science")
            let myVC = storyboard?.instantiateViewController(withIdentifier: "nbaQuestions") as! NBAViewController
            myVC.category = "Science"
            self.category = "Science"
            self.present(myVC, animated: true, completion: nil)
        } else if category.name == "Music" {
            NSLog("In Movies")
            let myVC = storyboard?.instantiateViewController(withIdentifier: "nbaQuestions") as! NBAViewController
            myVC.category = "Music"
            self.category = "Music"
            self.present(myVC, animated: true, completion: nil)
        } else if category.name == "Movies" {
            NSLog("In Movies")
            let myVC = storyboard?.instantiateViewController(withIdentifier: "nbaQuestions") as! NBAViewController
            myVC.category = "Movies"
            self.category = "Movies"
            self.present(myVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func settings(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func fetchJson() {
        categories = repo.getCategories()
        let jsonUrlString = "https://tednewardsandbox.site44.com/questions.json"
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with:url) {(data, response, error) in
            guard let data = data else {return}
            do{
                let details = try JSONDecoder().decode([CategoryQuizInfo].self, from: data)
                for i in details {
                    self.repo.addCategories(category: i.title)
                    print(i.questions[0])
                    print("\n")
                }
                self.categories = self.repo.getCategories()
                
            } catch let jsonError{
                print(jsonError)
            }
        }.resume()
    }
}

