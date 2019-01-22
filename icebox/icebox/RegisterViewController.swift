//
//  RegisterViewController.swift
//  icebox
//
//  Created by Jesús Tirado on 1/22/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import Alamofire
import UIKit

class RegisterViewController: UIViewController {
    
    //Defined a constant that holds the URL for our web service
    let URL_USER_REGISTER = "http://mirandaromo.com/icebox/v1/register.php"
    
    //View variables
    @IBOutlet weak var fieldUsername: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldPhone: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    //Button action
    @IBAction func buttonRegister(_ sender: UIButton) {
        //creating parameters for the post request
        let parameters: Parameters=[
            "username":fieldUsername.text!,
            "password":fieldPassword.text!,
            "name":fieldName.text!,
            "email":fieldEmail.text!,
            "phone":fieldPhone.text!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
