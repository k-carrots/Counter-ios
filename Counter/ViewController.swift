//
//  ViewController.swift
//  Counter
//
//  Created by Nick on 26.03.2024.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterMinus: UIButton!
    @IBOutlet weak var counterPlus: UIButton!
    @IBOutlet weak var counterRestart: UIButton!
    @IBOutlet weak var counterHistory: UITextView!
    private var counterInt: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func autoScroll() {
        let range = NSMakeRange(counterHistory.text.count - 1, 0)
        counterHistory.scrollRangeToVisible(range)
    }
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    @IBAction func counterPlusTouch(_ sender: Any) {
        
        counterInt += 1
        counterLabel.text = "\(counterInt)"
        counterHistory.text += "\n\(formatDate()): значение изменено на +1"
        autoScroll()
        
    }
    @IBAction func counterMinusTouch(_ sender: Any) {
        if counterInt > 0 {
            counterInt -= 1
            counterLabel.text = "\(counterInt)"
            counterHistory.text += "\n\(formatDate()): значение изменено на +1"
        } else {
            counterHistory.text += "\n\(formatDate()): попытка уменьшить значение счётчика ниже 0"
        }
        autoScroll()
    }
    @IBAction func counterRestartTouch(_ sender: Any) {
        counterInt = 0
        counterLabel.text = "\(counterInt)"
        counterHistory.text += "\n\(formatDate()): значение сброшено"
        autoScroll()
    }
    
    
    

}

