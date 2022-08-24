//
//  ViewController.swift
//  EViOS2
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class Login: UIViewController {
    
    
    @IBAction func googleButton(){
        
        if let loginPage = storyboard?.instantiateViewController(withIdentifier: "loginPage") as? ConnectViewController {
            loginPage.image = "google_header"
            loginPage.modalPresentationStyle = .fullScreen
            present(loginPage, animated: true, completion: nil)
        }
        
        
        
        
    }
    @IBAction func facebookButton(){
        if let loginPage = storyboard?.instantiateViewController(withIdentifier: "loginPage") as? ConnectViewController {
            loginPage.image = "faceook_header"
            loginPage.modalPresentationStyle = .fullScreen
            present(loginPage, animated: true, completion: nil)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
}

