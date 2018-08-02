//
//  ViewController.swift
//  FacebookOperations
//
//  Created by Prashant G on 8/2/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit
import FacebookCore

import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var logInLogOutButton: UIButton!
    
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fbLogInAction(_ sender: Any) {
        
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            print("User is already logged in with token \(accessToken)")
            loginButtonClicked()
        }
        else{
            loginButtonClicked()
        }
        
    }
    
    
    //when login button clicked
    @objc func loginButtonClicked() {
        
        let loginManager = LoginManager()
        
        if logInLogOutButton.titleLabel?.text == "LOG IN" {
        
            loginManager.logIn(readPermissions: [.publicProfile], viewController: self) { loginResult in
                
                switch loginResult {
                case .failed(let error):
                    print(error)
                case .cancelled:
                    print("User cancelled login.")
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    self.logInLogOutButton.setTitle("LOG OUT", for: .normal)
                    self.getFBUserData()
                }
            }
            
        }
        else {
            loginManager.logOut()
            self.logInLogOutButton.setTitle("LOG IN", for: .normal)
        }
        
        
        
        
    }
    
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShareOnFbViewController") as! ShareOnFbViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            })
        }
    }


}


/*
 
 import FacebookCore
 import FacebookLogin
 
 func viewDidLoad() {
 // Add a custom login button to your app
 let myLoginButton = UIButton(type: .Custom)]
 myLoginButton.backgroundColor = UIColor.darkGrayColor()
 myLoginButton.frame = CGRect(0, 0, 180, 40);
 myLoginButton.center = view.center;
 myLoginButton.setTitle("My Login Button" forState: .Normal)
 
 // Handle clicks on the button
 myLoginButton.addTarget(self, action: @selector(self.loginButtonClicked) forControlEvents: .TouchUpInside)
 
 // Add the button to the view
 view.addSubview(myLoginButton)
 }
 
 // Once the button is clicked, show the login dialog
 @objc func loginButtonClicked() {
 let loginManager = LoginManager()
 loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
 switch loginResult {
 case .Failed(let error):
 print(error)
 case .Cancelled:
 print("User cancelled login.")
 case .Success(let grantedPermissions, let declinedPermissions, let accessToken):
 print("Logged in!")
 }
 }
 
 
 
 */
