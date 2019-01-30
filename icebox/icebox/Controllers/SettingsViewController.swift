//
//  SettingsViewController.swift
//  icebox
//
//  Created by Jesús Tirado on 1/26/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var buttomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttomView.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOffButtom(_ sender: Any) {
        
        let log = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        self.navigationController?.pushViewController(log, animated: true)
    }
    
}
