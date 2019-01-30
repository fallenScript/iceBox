//
//  UserViewController.swift
//  icebox
//
//  Created by Jesús Tirado on 1/20/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import UIKit
import Alamofire

class UserViewController: UIViewController {
    
    //The login script url make sure to write the ip instead of localhost
    //you can get the ip using ifconfig command in terminal
    let URL_USER_LOGIN = "http://mirandaromo.com/icebox/v1/login.php"
    
    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard
    
    //the connected views
    //don't copy instead connect the views using assistant editor
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    //the button action function
    @IBAction func buttonLogin(_ sender: UIButton) {
        
        //getting the username and password
        let parameters: Parameters=[
            "username":textFieldUserName.text!,
            "password":textFieldPassword.text!
        ]
        
        //making a post request
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "id") as! Int
                        let userName = user.value(forKey: "username") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userPhone = user.value(forKey: "phone") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userName, forKey: "username")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        self.defaultValues.set(userPhone, forKey: "userphone")
                        
                        //switching the screen
                        //self.performSegue(withIdentifier: "showFreezerTable", sender: self)
                        let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! StocksTableViewController
                        self.navigationController?.pushViewController(ViewController, animated: true)
                        
                        self.dismiss(animated: false, completion: nil)
                    }else{
                        //error message in case of invalid credential
                        self.labelMessage.text = "Invalid username or password"
                    }
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hiding the navigation button
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        // Do any additional setup after loading the view, typically from a nib.
        UITextField.appearance().tintColor = UIColor.black
        
        //if user is already logged in switching to profile screen
        if defaultValues.string(forKey: "username") != nil{
            //self.performSegue(withIdentifier: "showFreezerTable", sender: self)
            let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! StocksTableViewController
            self.navigationController?.pushViewController(ViewController, animated: false)
            
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
