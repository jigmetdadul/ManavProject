//
//  MaintabBarController.swift
//  ManavProject
//
//  Created by Jigmet stanzin Dadul on 26/06/23.
//

import UIKit

class MaintabBarController: UITabBarController {

    @IBOutlet weak var mainTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTabBar.isTranslucent = true
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
