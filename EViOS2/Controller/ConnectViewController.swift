//
//  ConnectViewController.swift
//  EViOS2
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class ConnectViewController: UIViewController {
    @IBOutlet var loginTextFiled: UITextField!
    
    @IBOutlet var passworTextField: UITextField!
    
    @IBOutlet var connectButton: UIButton!
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var headerImage: UIImageView!
    
    var image: String!
    
    func showError(){
        let alert = UIAlertController(title: "ERROR", message: "Les champs ne peuvent pas être vide", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
           present(alert, animated: true)    }
    
    func performLogin(){
        if let validLogin = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController")
        {
            validLogin.modalPresentationStyle = .fullScreen
            present(validLogin, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func show(){
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if predicate.evaluate(with: loginTextFiled.text) && passworTextField.text?.count ?? 0 >= 4 {
            performLogin()
        } else{
            showError()
        }
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerImage.image = UIImage(named: image)
        
        loginTextFiled.delegate = self
        passworTextField.delegate = self
        
        #if DEBUG
        loginTextFiled.text = "cedric@debroux.be"
        passworTextField.text = "hsgqdjedgzieo"
        #endif
    }
    



}

extension ConnectViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        if textField == loginTextFiled{
            passworTextField.becomeFirstResponder()
        }else if (textField == passworTextField){
            view.endEditing(true)
        }
        

        return true
    }
    }
