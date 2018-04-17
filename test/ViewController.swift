//
//  ViewController.swift
//  test
//
//  Created by Bethany Percival on 09/04/2018.
//  Copyright © 2018 Bethany Percival. All rights reserved.
//

import UIKit


enum EquationType: Int {
    case multiply, subtract, add, equals, none
}

class ViewController: UIViewController {
    
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var display: UILabel!
    var equationType: EquationType = .none
    var firstNumber: Int = 0
    
    
    var btnStrings: [[String]] {
        return [
            ["7", "8", "9", "x"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "+"],
            ["0", "AC", ".", "="]
        ]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup() {
        guard let stackArr: [UIStackView] = verticalStackView.arrangedSubviews as? [UIStackView] else {
            return
        }
        
        for (verIdx, horizontalStackView) in stackArr.enumerated() {
            for string in btnStrings[verIdx] {
                let btn = UIButton()
                btn.setTitle(string, for: .normal)
                
                horizontalStackView.addArrangedSubview(btn)
                btn.setTitleColor(.black, for: .normal)
                btn.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
                
            }
        }
        display.textAlignment = .right
    }
    
    @objc func onClick(_ selector: UIButton) {
        guard let text = selector.title(for: .normal) else { return }
        display.text = text
        switch text {
        case "x":
            equationType = .multiply
        case "-":
            equationType = .subtract
        case "+":
            equationType = .add
        case "=":
            equationType = .equals
        case ".":
            
        case "AC":
            
        default:
            if isNumber(text) && equationType == .none {
                if firstNumber == 0 {
                    firstNumber = Int(text) ?? 0
                } else {
                    
                }
            }
        }
    }
    
    func isNumber(_ text: String) -> Bool {
        let num = Int(text)
        if num != nil {
            return true
        }
        return false
    }
}
