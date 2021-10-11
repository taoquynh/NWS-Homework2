//
//  RandomImageViewController.swift
//  Homework02
//
//  Created by Taof on 11/10/2021.
//

import UIKit

class RandomImageViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var changeButton: UIButton!
    var imgNames: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var randomName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomName = random()
        changeButton.setTitle("Đổi ảnh", for: .normal)
        photoImageView.image = UIImage(named: randomName)
        photoImageView.contentMode = .scaleAspectFit
    }
    @IBAction func onChange(_ sender: Any) {
        randomName = random()
        photoImageView.image = UIImage(named: randomName)
        
    }
    func random() -> String {
        var name = imgNames.randomElement()!
        if randomName == name{
            name = random()
        }
        
        return name
    }
}
