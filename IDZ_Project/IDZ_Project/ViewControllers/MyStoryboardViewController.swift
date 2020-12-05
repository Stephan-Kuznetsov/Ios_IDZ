//
//  MyStoryboardViewController.swift
//  IDZ_Project
//
//  Created by Ais Moll on 04.12.2020.
//  Copyright © 2020 Ais Moll. All rights reserved.
//

import UIKit

class MyStoryboardViewController: UIViewController {

    enum Constants{
        static let Login = "user"
        static let Password = "password"
    }
    @IBOutlet var LoginField: UITextField!
    @IBOutlet var PasswField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LoginTouch(_ sender: UIButton) {
        CheckLogin()
    }
    private func CheckLogin()
    {
        let login = LoginField.text
        let passw = PasswField.text
        if (login == Constants.Login && passw == Constants.Password)
        {
            let viewC = (storyboard?.instantiateViewController(withIdentifier: "AppViewController1"))
            navigationController?.pushViewController(viewC!, animated: true)
            
        }
        else
        {
            let alertContr = UIAlertController(title: "Сообщение",
                                               message: "Не удалось выполнить вход в систему. Пожалуйста, проверьте введенные данные.",
                                               preferredStyle: .alert)
            alertContr.addAction(.init(title: "Принять", style: .cancel, handler: nil))
            present(alertContr, animated: true, completion: nil)
            // Please, check entered data
        }
    }
}
