//
//  RandomNumberViewController.swift
//  Homework02
//
//  Created by Taof on 11/10/2021.
//

import UIKit

class RandomNumberViewController: UIViewController {
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    var random: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        random = Int.random(in: 0...100)
        print(random)
        
        // isHidden = true: ẩn một đối tượng
        resultLabel.isHidden = true
        resultLabel.textAlignment = .center
        
        // đặt thuộc tính keyboard cho TextField
        inputTextField.keyboardType = .numberPad
        inputTextField.placeholder = "Nhập số 0 ~ 100."
        
        reloadButton.setImage(UIImage(systemName: "repeat"), for: .normal)
        reloadButton.setTitle("", for: .normal)
    }
    
    @IBAction func onRandom(_ sender: Any) {
        // kiểm tra nếu textField có giá trị và có thể ép về Int thì gán lại vào number,
        guard let number = Int(inputTextField.text!) else {
            return
        }
        
        resultLabel.isHidden = false
        if number < random {
            resultLabel.text = "Bé quá!"
        } else if number > random {
            resultLabel.text = "Lớn quá!"
        } else {
            resultLabel.text = "Chúc mừng!"
        }
    }
    
    @IBAction func onReload(_ sender: Any) {
        inputTextField.text = ""
        resultLabel.isHidden = true
        random = Int.random(in: 0...100)
    }
}
