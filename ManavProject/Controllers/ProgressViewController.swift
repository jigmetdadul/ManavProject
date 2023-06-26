//
//  ProgressViewController.swift
//  ManavProject
//
//  Created by Jigmet stanzin Dadul on 26/06/23.
//

import UIKit

class ProgressViewController: UIViewController {

    
    
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var firstTableView: UIView!
    @IBOutlet weak var secondTableView: UIView!

    @IBOutlet weak var firstTable: UITableView!
    @IBOutlet weak var secondTable: UITableView!
    var objectiveDict = [String:String]()
    var objectiveIconArr = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        objectiveDict = ["Drink Water": "Drink At least 8 cups", "Read": "Read at least 25 pages", "Exercise":"Got to the gym or do cardio", "Learn Spanish": "Study spanish fro 20 cups", "Code": "Atleast learn new topics"]
        objectiveIconArr = ["Drink Water":"💧", "Read": "📖","Exercise": "🏃🏽","Learn Spanish": "🇪🇸", "Code": "👨🏽‍💻"]
        topImage.layer.cornerRadius = 35
        
        firstTable.layer.cornerRadius = 14
        secondTable.layer.cornerRadius = 14
        firstTable.dataSource = self
        firstTable.delegate = self
        secondTable.delegate = self
        secondTable.dataSource = self
        firstTable.register(UINib(nibName: "ProgressTableViewCell", bundle: nil), forCellReuseIdentifier: "progressCell")
        secondTable.register(UINib(nibName: "ProgressTableViewCell", bundle: nil), forCellReuseIdentifier: "progressCell")
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ProgressViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectiveDict.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! ProgressTableViewCell
        let keys = Array(objectiveDict.keys)
        
       
        cell.objectiveHeadLabel.text = keys[indexPath.row]
        cell.objectiveDetailLabel.text = objectiveDict[keys[indexPath.row]]
        cell.objectiveIconLabel.text = objectiveIconArr[keys[indexPath.row]]
        
        return cell
    }

}
