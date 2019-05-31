//
//  ViewController.swift
//  RightpointApp
//
//  Created by argenis delarosa on 5/6/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  var loginServices = LoginService()
  
  // MARK: - Properties
  
  @IBOutlet weak var bgImg: UIImageView!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.isNavigationBarHidden = true
  }
  
  // MARK: - Login Button
  
  @IBAction func loginButton(_ sender: Any) {
    
    let emailText = emailTextField.text
    let passwordText = passwordTextField.text
    
    if (emailText != "rightpoint" || passwordText != "test") || (emailText!.isEmpty || passwordText!.isEmpty) {
      
      displayAlert(userMessage: "You must have forgot to put in your info or you got it wrong! Please try again for a smooth login experience.")
      
      return
      
    } else {
      
      self.loginServices.login(username: emailText!, password: passwordText!) { (result) in
        
        print(result)
        
        DispatchQueue.main.async {
          
          func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "LoginToFirst" {
              
              let destination = segue.destination as! FirstTableViewController
              
              destination.users = result.users
              
            }
            
          }
          
        }
        
      }
      
    }
    
  }
  
  // MARK: - Alert
  
  func displayAlert(userMessage: String) {
    
    let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
  }
  
}




