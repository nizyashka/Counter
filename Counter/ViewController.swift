//
//  ViewController.swift
//  Counter
//
//  Created by Алексей Непряхин on 09.12.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counter: Int = 0
    
    private let dateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "\(counter)"
        historyTextView.layer.borderWidth = 2
        historyTextView.layer.borderColor = UIColor.systemBlue.cgColor
        historyTextView.layer.cornerRadius = 10
    }
    
    private func getDate(_ currentDate: Date) -> String {
        return dateFormatter.string(from: currentDate)
    }

    @IBAction private func plusOne() {
        counter += 1
        counterLabel.text = "\(counter)"
        historyTextView.text += "\n[\(getDate(Date.now))]: Значение изменено на +1"
    }
    
    @IBAction private func minusOne() {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "\(counter)"
            historyTextView.text += "\n[\(getDate(Date.now))]: Значение изменено на -1"
        } else {
            historyTextView.text += "\n[\(getDate(Date.now))]: Попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBAction private func setToZero() {
        counter = 0
        counterLabel.text = "\(counter)"
        historyTextView.text += "\n[\(getDate(Date.now))]: Значение сброшено"
    }
}
