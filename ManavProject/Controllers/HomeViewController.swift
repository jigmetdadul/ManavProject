//
//  HomeViewController.swift
//  ManavProject
//
//  Created by Jigmet stanzin Dadul on 26/06/23.
//

import UIKit

class HomeViewController: UIViewController, ObjectiveCellDelegate {
    func addingProgress() {
        checkedCount += 1
        print(checkedCount)
        updatingProgressBar()
    }
    
    func subtractProgress() {
        if checkedCount < 0{
            checkedCount = 0
        }
        checkedCount -= 1
        updatingProgressBar()
    }
    

    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var homeImage: UIImageView!
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var objectiveTableView: UIView!
    
    @IBOutlet weak var objectiveProgressBar: UIProgressView!
    
    @IBOutlet weak var tableView: UITableView!

    var objectiveDict = [String:String]()
    var objectiveIconArr = [String:String]()
    var objectiveCount:Int = 0
    var checkedCount:Int = 0
    private let floatingButtons: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        
        button.backgroundColor = .systemIndigo
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.tintColor = .systemBackground
        button.setImage(image, for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        //Adding shadow to the button
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.6
        //Deals with the corner radius
        button.layer.cornerRadius = 30
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    objectiveDict = ["Drink Water": "Drink At least 8 cups", "Read": "Read at least 25 pages", "Exercise":"Got to the gym or do cardio", "Learn Spanish": "Study spanish fro 20 cups", "Code": "Atleast learn new topics"]
    objectiveIconArr = ["Drink Water":"💧", "Read": "📖","Exercise": "🏃🏽","Learn Spanish": "🇪🇸", "Code": "👨🏽‍💻"]
  
        homeImage.layer.cornerRadius = 35
        progressView.layer.cornerRadius = 14
        objectiveTableView.layer.cornerRadius = 14
        view.addSubview(floatingButtons)
        floatingButtons.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "objectiveCellTableViewCell", bundle: nil), forCellReuseIdentifier: "objectiveCell")
        // Do any additional setup after loading the view.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButtons.frame = CGRect(x: view.frame.size.width - 84, y: view.frame.size.height - 150, width: 60, height: 60)
    }
    
    @objc func didTapAddButton(){
        //add uialert action
        var enteredHead = UITextField()
        var enteredDetails = UITextField()
        var enteredSticker = UITextField()
        let alert = UIAlertController(title: "Add new Objective", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default){(action) in
            //what will happen once the user clicks the add button
            if let head = enteredHead.text, let detail = enteredDetails.text, let sticker = enteredSticker.text{
                self.objectiveDict[head] = detail
                self.objectiveIconArr[head] = sticker
//                self.objectiveChecked[head] = false
                self.objectiveCount += 1
                self.tableView.reloadData()
            }
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter a Objective heading"
            enteredHead = alertTextField
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter Objective's Detail"
            enteredDetails = alertTextField
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter a sticker"
            enteredSticker = alertTextField
        }
        //action will be displayes
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func updatingProgressBar(){
        let progress = Float(checkedCount)/Float(objectiveCount)
        objectiveProgressBar.progress = progress
        
        progressLabel.text = "\(Int(progress*100)) %"
    }
}



//MARK: - Table View

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        objectiveCount = objectiveDict.count
        return objectiveDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "objectiveCell", for: indexPath) as! objectiveCellTableViewCell
        let keys = Array(objectiveDict.keys)
        
        cell.delegate = self
        cell.objectiveHeadLabel.text = keys[indexPath.row]
        cell.objectiveDetailLabel.text = objectiveDict[keys[indexPath.row]]
        cell.objectiveIconLabel.text = objectiveIconArr[keys[indexPath.row]]
        updatingProgressBar()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}
