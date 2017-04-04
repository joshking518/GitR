//
//  ViewController.swift
//  ClipR
//
//  Created by Josh King on 3/24/17.
//  Copyright © 2017 Public Health Innovations. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var characterCounter: UILabel!
    @IBOutlet weak var beforeCharacterCounter: UILabel!
    

    override func viewDidLoad() {

        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [UIColor(red:0.15, green:0.94, blue:0.94, alpha:1.0).cgColor, UIColor(red:0.19, green:0.20, blue:0.58, alpha:1.0).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Takes inputed text and changes the label to it after running it through the label shortener.  Then shows total characters.
    @IBAction func getText(_ sender: UITextField) {
        if let myText = sender.text {
            
            beforeCharacterCounter.text = "Total Characters Before: \(myText.characters.count)"
            
            displayLabel.text = shortenLabel(myText)
            
            characterCounter.text = "Total Characters After: \(inputLength())"
        }
    }

    
    // Counts the number of characters in the inputted text (This is used to avoid Optional interference using displayLabel.text.characters.count)
    func inputLength() -> Int {
        if let text: String = displayLabel.text {
            let length: Int = text.characters.count
            return length
        }
        return 0
    }
    
    // Checks the inputed label against certain words and replaces them, returning the new input
    func shortenLabel(_ text: String) -> String {
        
        var newText1 = text
        var newText2 = text
        var newText3 = text
        var newText4 = text
        var newText5 = text
        var newText6 = text
        var newText7 = text
        var newText8 = text
        var newText9 = text
        
        // Array of words to check for
        let myWords = ["with", "because", "double", "for", "oh my god", "to", "be", "i don't know", "in my opinion"]
        
        // Loops through the checked words and returns the text with the shortened version if applicable
        for i in myWords {
            if text.lowercased().range(of: i) != nil {
                newText1 = text.replacingOccurrences(of: "with", with: "w")
                newText2 = newText1.replacingOccurrences(of: "because", with: "bc")
                newText3 = newText2.replacingOccurrences(of: "double", with: "dbl")
                newText4 = newText3.replacingOccurrences(of: "for", with: "4")
                newText5 = newText4.replacingOccurrences(of: "oh my god", with: "omg")
                newText6 = newText5.replacingOccurrences(of: "to", with: "2")
                newText7 = newText6.replacingOccurrences(of: "be", with: "B")
                newText8 = newText7.replacingOccurrences(of: "i don't know", with: "idk")
                newText9 = newText8.replacingOccurrences(of: "in my opinion", with: "imo")
            }
        }
        return newText9
    }
    
    // FUTURE FEATURES???
    // Make DisplayLabel Copyable so the user can just copy and paste into twitter [MAIN FEATURE]
    
    
    // http://www.smart-words.org/abbreviations/text.html <- list of word abbreviations
    // https://github.com/zoul/UILabel-Clipboard-Sample <- code for making a uilabel copyable
    // Design the finished product
    
}


