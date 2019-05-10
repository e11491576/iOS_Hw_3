//
//  GameViewController.swift
//  iOS_Hw_3
//
//  Created by User22 on 2019/5/2.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

var timer: Timer?
var oldTime = "00"
let images = ["Sheep","Wolf","FakeSheep","FakeWolf"]
var i = 0




class GameViewController: UIViewController {
    var gameScore = 0
    var name: String?
    var countDown = 10
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var noHitButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "2")!)
        gameScore = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            if(self.countDown > 0){
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss\nyyyy/MMM/dd E"
            let time = formatter.string(from: now)
            self.timeLabel.text = String(self.countDown)
            
            formatter.dateFormat = "ss"
            let newTime = formatter.string(from: now)
            if newTime > oldTime || (newTime == "00" && oldTime != "00"){
                let ramdomNumber = Int.random(in: 0...3)
                i = ramdomNumber
                self.imageView.image = UIImage(named: images[i])
                oldTime = newTime
                }
                self.countDown -= 1
            }
            else{
                if timer != nil {
                    timer?.invalidate() // Stop timer
                    let  userDefault =  UserDefaults.standard
                    userDefault.set(self.gameScore, forKey:  "score")
                    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1, delay: 0, animations: {
                        self.imageView.frame = CGRect(x: 150, y: 300, width: 0, height: 0)
                        self.imageView.alpha = 1}, completion: nil)
                    self.timeLabel.text = "Time's Up!"
                    self.returnButton.isHidden = false
                }
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
        }
    }
    
    var wolf = Animal(animalType: "Wolf", animalPoint: 1)
    var fakeWolf = Animal(animalType: "FakeWolf", animalPoint: -2)
    var sheep = Animal(animalType: "Sheep", animalPoint: -1)
    var fakeSheep = Animal(animalType: "FakeSheep", animalPoint: 2)
    
    @IBAction func hitButtonAction(_ sender: Any) {
        switch i {
        case 0:
            gameScore += sheep.animalPoint
            let controller = UIAlertController(title: "打到羊了!", message: "扣一分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)

        case 1:
            gameScore += wolf.animalPoint
            let controller = UIAlertController(title: "打到狼了!", message: "加一分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)

        case 2:
            gameScore += fakeSheep.animalPoint
            let controller = UIAlertController(title: "打到披著羊皮的狼了!", message: "加兩分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)

        case 3:
            gameScore += fakeWolf.animalPoint
            let controller = UIAlertController(title: "打到披著狼皮的羊了!", message: "扣兩分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)

        default:
            break
            }
        
        scoreLabel.text = String(gameScore)
    }
    @IBAction func noHitButtonAction(_ sender: Any) {
        switch i {
        case 0:
            gameScore -= sheep.animalPoint
            let controller = UIAlertController(title: "沒打到羊!", message: "加一分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
        case 1:
            gameScore -= wolf.animalPoint
            let controller = UIAlertController(title: "沒打到狼!", message: "扣一分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
        case 2:
            gameScore -= fakeSheep.animalPoint
            let controller = UIAlertController(title: "沒打到披著羊皮的狼!", message: "扣兩分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
        case 3:
            gameScore -= fakeWolf.animalPoint
            let controller = UIAlertController(title: "沒打到披著狼皮的羊!", message: "加兩分！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
        default:
            break
        }
        scoreLabel.text = String(gameScore)
        
        
    }
    

    
}
