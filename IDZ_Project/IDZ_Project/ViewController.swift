//
//  ViewController.swift
//  IDZ_Project
//
//  Created by Ais Moll on 04.12.2020.
//  Copyright © 2020 Ais Moll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonTouch(_ sender: UIButton) {
        let stb = UIStoryboard(name: "MyStoryboard", bundle: nil)
        let viewC = stb.instantiateInitialViewController()!
        present(viewC, animated: true, completion: nil)
    }
    
    @IBAction func Dz2ButtonTouch(_ sender: UIButton) {
        
        let stb = UIStoryboard(name: "TableIdz", bundle: nil)
        let viewC = stb.instantiateInitialViewController()!
        present(viewC, animated: true, completion: nil)
    }
}

