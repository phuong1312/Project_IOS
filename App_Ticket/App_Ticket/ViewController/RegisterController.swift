//
//  RegisterController.swift
//  App_Ticket
//
//  Created by moon on 5/28/22.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElement()
    }
    
    func setUpElement() {
        Utilities.styleTextField(user)
        Utilities.styleTextField(password)
        Utilities.styleTextField(rePassword)
        Utilities.styleTextField(phone)
        Utilities.styleTextField(email)
        Utilities.styleHollowButton(btnRegister)
    }
}
