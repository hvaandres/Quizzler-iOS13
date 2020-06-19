//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
   let quiz = [
     Question(q: "A slug's blood is green.", a: "True"),
          Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
          Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
          Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
          Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
          Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
          Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
          Question(q: "Google was originally called 'Backrub'.", a: "True"),
          Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
          Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
          Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
          Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle //True & False
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Create a function that will let you choose the right or wrong answer without getting stuck after the third question.
        
        // If you increase +1 after question Number, you will need to count the questions. Then you will need to add 1 more to make sure will do three at the same time.
        
        // Also to make sure the app don't crash, you will need to add an else statement to make sure you can reset the count to 0. In this way, the user will need to restart the questions.
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1 // You add one more to make sure the count will not stop at the next question
        } else {
            questionNumber = 0 //This is added to make sure you will start with question number one
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz[questionNumber].text// You need to ask for the array and the tell the computer to get all the questions to make sure we can see them.
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float (questionNumber + 1) / Float (quiz.count)
    }

}

