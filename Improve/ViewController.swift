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
    // Quote Label
    @IBOutlet weak var quote: UILabel!
    
    
    //Challenges, Quotes and Labels
    var challenges = ["Make your bed", "Clean your room", "Compliment a stranger", "Drink 8 cups of water", "Go for a walk", "Go for a jog", "Organize your desk", "Don't procrastinate", "Call a friend", "Create a todo list", "Work on a skill", "Work on a project", "Meditate for 5 minutes", "Write down something you're grateful for", "Read for 15 minutes", "Do 10 push ups", "Watch a TED Talk", "Learn a new word", "Read an article", "Eat a fruit", "Eat a vegetable", "Teach someone something", "Do 25 situps", "Think of something positive", "Start a budget", "Talk to a stranger", "Face a fear", "Tell someone you love them", "Make your own lunch", "Stay off social media for 1 hour", "Do something kind", "Spend 30 minutes focusing on a task"]
    var backgrounds = [""]
    var quotes = ["“All our dreams can come true, if we have the courage to pursue them.” – Walt Disney", "“The secret of getting ahead is getting started.” – Mark Twain", "“I’ve missed more than 9,000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life and that is why I succeed.” – Michael Jordan", "“It’s hard to beat a person who never gives up.” – Babe Ruth"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonTap(_ sender: Any) {
        changeChallenge()
        changeQuote()
        didTapButton()
    }
    
    // Functions
    func changeChallenge() {
        if let newChallenge = challenges.randomElement() {
            challenge.text = newChallenge
        }
    }
    
    func changeQuote() {
        if let newQuote = quotes.randomElement() {
            quote.text = newQuote
        }
    }

    
    
    @objc private func didTapButton() {
        
        let userDefaults = UserDefaults(suiteName: "group.com.haraki.goodday")
        
        guard let challengeText = challenge?.text else {
            return
        }
        
        userDefaults?.setValue(challengeText, forKey: "challenge")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    
}


