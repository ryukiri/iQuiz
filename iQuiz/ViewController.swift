//
//  ViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/19/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit

struct CategoryQuizInfo : Decodable {
    let title : String
    let desc : String
    let questions : [Question]
}

struct Question : Decodable {
    let text : String
    let answer : String
    let answers : [String]
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewQuizCategories: UITableView!
    var categories : [String] = [""]
    var details : [String] = [""]
    var category : String = ""
    let repo = QuizRepository()
    var questions : [CategoryQuizInfo] = [CategoryQuizInfo]()
    var questionNumber : Int = 0
    var categoryNumber : Int = 0
    var correctNumber: Int = 0
    var link = "https://tednewardsandbox.site44.com/questions.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchJson(jsonUrl: link)
        tableViewQuizCategories.dataSource = self
        tableViewQuizCategories.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //NSLog("numberOfRowsInSection called")
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //NSLog("We are being asked for indexPath \(indexPath)()")
        let index = indexPath.row
        let category = categories[index]
        let detail = details[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblViewCell", for: indexPath)
        cell.textLabel?.text = category
        cell.detailTextLabel?.text = detail
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
        let category = categories[indexPath.row]
        //NSLog("User selected row at \(category)")
        categoryNumber = indexPath.row
        
        let alert = UIAlertController(title: "You selected", message: category, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        //self.present(alert, animated: true, completion: nil)
        
        var questionVC = self.storyboard?.instantiateViewController(withIdentifier: "questions") as! QuestionViewController
        questionVC.categoryNumber = categoryNumber
        questionVC.questionNumber = questionNumber
        questionVC.questions = questions
        questionVC.correctNumber = correctNumber
        questionVC.link = link
        self.present(questionVC, animated: true, completion: nil)
    }
    
    func fetchJson(jsonUrl: String) {
        let jsonUrlString = jsonUrl
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let details = try JSONDecoder().decode([CategoryQuizInfo].self, from: data)
                for i in details {
                    self.repo.addCategories(category: i.title)
                    self.repo.addDetails(detail: i.desc)
                }
                self.questions = details
                
                self.categories = self.repo.getCategories()
                self.details = self.repo.getDetails()
                DispatchQueue.main.async{
                    self.tableViewQuizCategories.reloadData()
                }
            } catch let e{
                print(e)
            }
        }.resume()
        
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Change URL", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "Enter URL here"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.fetchJson(jsonUrl: (textField?.text)!)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var qvc = segue.destination as! QuestionViewController
    }

}

