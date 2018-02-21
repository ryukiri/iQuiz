//
//  ViewController.swift
//  iQuiz
//
//  Created by Austin Quach on 2/19/18.
//  Copyright © 2018 Austin Quach. All rights reserved.
//

import UIKit
import SystemConfiguration

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
    //var link = "https://api.myjson.com/bins/g5fup"
    var link = UserDefaults.standard.string(forKey: "url") ?? "https://tednewardsandbox.site44.com/questions.json"
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchJson(link)
        tableViewQuizCategories.dataSource = self
        tableViewQuizCategories.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        
        // this is the replacement of implementing: "collectionView.addSubview(refreshControl)"
        tableViewQuizCategories.refreshControl = refreshControl
    }
    
    @objc func reload(refreshControl: UIRefreshControl) {
        tableViewQuizCategories.reloadData()
        
        // somewhere in your code you might need to call:
        refreshControl.endRefreshing()
    }

    override func viewDidAppear(_ animated: Bool) {
        if connectedToNetwork() == false {
            print("No Internet")
            let alert = UIAlertController(title: "There is no internet connection.", message: "Your experience may be limited.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            fetchLocalFile(file: "questions")
        } else {
            print("Internet")
        }
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
        cell.imageView?.image = UIImage(named: "icon.png")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func fetchJson(_ jsonUrl: String) {
        let jsonUrlString = jsonUrl
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                let alert = UIAlertController(title: "ERROR", message: "Please check URL", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            UserDefaults.standard.set(self.link, forKey: "url")
            do {
                let details = try JSONDecoder().decode([CategoryQuizInfo].self, from: data)
                self.repo.categories = [String]()
                self.repo.details = [String]()
                print(details)
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
        let alert = UIAlertController(title: "Settings", message: "Enter Data URL", preferredStyle: UIAlertControllerStyle.alert)
        var urlTextField: UITextField = UITextField()
        
        alert.addTextField { (textField: UITextField) in
            urlTextField = textField
            urlTextField.placeholder = "Enter url here"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Check now", style: UIAlertActionStyle.default, handler:{
            (act: UIAlertAction) in
            if((urlTextField.text) != nil){
                self.fetchJson(urlTextField.text!)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func connectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    func fetchLocalFile(file: String){
        do {
            if let file = Bundle.main.url(forResource: "\(file)", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [Any] {
                    // json is an array
                    print("Object: \(object)")
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }

}

