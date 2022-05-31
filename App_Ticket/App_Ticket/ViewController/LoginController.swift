//
//  ViewController.swift
//  App_Ticket
//
//  Created by moon on 5/24/22.
//

import UIKit

class LoginController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElement()
        
    }
    
    func setUpElement() {
        Utilities.styleTextField(userName)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(btnLogin)
        Utilities.styleHollowButton(btnRegister)
    }

}

