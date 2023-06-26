//
//  HabitsViewController.swift
//  ManavProject
//
//  Created by Jigmet stanzin Dadul on 26/06/23.
//

import UIKit
import FLCharts

class HabitsViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var topImage: UIImageView!
    
    @IBOutlet weak var firstChartImage: UIImageView!
    @IBOutlet weak var secondChartImage: UIImageView!
    @IBOutlet weak var firstChartView: FLChart!
    @IBOutlet weak var secondChartView: FLChart!    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        topImage.layer.cornerRadius = 35
        firstChartImage.layer.cornerRadius = 14
        secondChartImage.layer.cornerRadius = 14
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
