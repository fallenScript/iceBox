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
    
    let URL_USER_REGISTER = "http://mirandaromo.com/icebox/v1/register.php"
    
    @IBOutlet weak var fieldUsername: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var fieldEmail: UITextField!
    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldPhone: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var buttonArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.appearance().tintColor = UIColor.black
        buttonArea.layer.cornerRadius = 10
    }
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        let parameters: Parameters=[
            "username":fieldUsername.text!,
            "password":fieldPassword.text!,
            "name":fieldName.text!,
            "email":fieldEmail.text!,
            "phone":fieldPhone.text!
        ]
        
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                print(response)
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func TextFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
