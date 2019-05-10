//
//  ViewController.swift
//  iOS_Hw_3
//
//  Created by User22 on 2019/5/2.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "1")!)
        
        let  userDefault =  UserDefaults.standard
        let  lastscore = userDefault.string(forKey:  "score")
        lastScore.text = lastscore
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        let controller = segue.destination as? GameViewController
        controller?.name = userName.text
    }
    
}

