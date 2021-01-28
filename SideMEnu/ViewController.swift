//
//  ViewController.swift
//  SideMEnu
//
//  Created by SRINIVASULU on 20/04/20.
//  Copyright © 2020 SRINIVASULU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn_HomeTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let HomeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(HomeVC, animated: true)
    }
    
}

