//
//  ViewController.swift
//  Improve
//
//  Created by Ryan Haraki on 2021-04-26.
//

import UIKit
import WidgetKit

class ViewController: UIViewController {

    // Challenge Label
    @IBOutlet weak var challenge: UILabel!
    // Description Label
    @IBOutlet weak var challengeDescription: UILabel!
    
    struct Challenge {
        var name: String
        var description: String
    }
    
    
    //Challenges, Quotes and Labels
    
    var backgrounds = [""]
    var challenges = [Challenge(name: "Learn a new word", description: "With more than a million words in the English language, there’s got to be one you don’t know!"), Challenge(name: "Tidy your workspace", description: "From empty cups to candy wrappers everything seems to end up on our desks. Decluttering can help you focus on the task at hand!")


]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func onButtonTap(_ sender: Any) {
        changeChallenge()
        didTapButton()
    }
    
    // Functions
    

    func changeChallenge() {
        if let newChallenge = challenges.randomElement() {
            challenge.text = newChallenge.name
            challengeDescription.text = newChallenge.description
        }
    }
    
    //
    @objc private func didTapButton() {
    
        
        let userDefaults = UserDefaults(suiteName: "group.com.haraki.goodday")
        
        guard let challengeText = challenge?.text else {
            return
        }
        
        userDefaults?.setValue(challengeText, forKey: "challenge")
        WidgetCenter.shared.reloadAllTimelines()
        
      
    }
        
    
    }
    
