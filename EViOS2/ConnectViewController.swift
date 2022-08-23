//
//  ConnectViewController.swift
//  EViOS2
//
//  Created by Cédric Debroux on 23/08/2022.
//

import UIKit

class ConnectViewController: UIViewController {

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var headerImage: UIImageView!
    
    var image: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerImage.image = UIImage(named: image)
    }
    



}
