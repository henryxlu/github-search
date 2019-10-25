//
//  ViewController.swift
//  GithubSearch
//
//  Created by Henry on 2019/7/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchData(_ sender: Any) {
//        self.performSegue(withIdentifier: "passSCV", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let suvc = segue.destination as! ShowUserViewController
        suvc.username = textfield.text
//        suvc.getUser(user: textfield.text ?? "gg")
    }
    


}

