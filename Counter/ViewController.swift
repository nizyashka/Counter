//
//  ViewController.swift
//  Counter
//
//  Created by Алексей Непряхин on 09.12.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var counter: Int = 0
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "\(counter)"
        historyTextView.layer.borderWidth = 2
        historyTextView.layer.borderColor = UIColor.systemBlue.cgColor
        historyTextView.layer.cornerRadius = 10
    }
    
    func getDate(_ currentDate: Date) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: currentDate)
    }

    @IBAction func plusOne() {
        counter += 1
        counterLabel.text = "\(counter)"
        historyTextView.text += "\n[\(getDate(Date.now))]: Значение изменено на +1"
    }
    
    @IBAction func minusOne() {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "\(counter)"
            historyTextView.text += "\n[\(getDate(Date.now))]: Значение изменено на -1"
        } else {
            historyTextView.text += "\n[\(getDate(Date.now))]: Попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBAction func setToZero() {
        counter = 0
        counterLabel.text = "\(counter)"
        historyTextView.text += "\n[\(getDate(Date.now))]: Значение сброшено"
    }
}
