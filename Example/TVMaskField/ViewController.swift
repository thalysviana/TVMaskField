//
//  ViewController.swift
//  TVMaskField
//
//  Created by Thalys Viana on 10/12/2020.
//  Copyright (c) 2020 Thalys Viana. All rights reserved.
//

import UIKit
import TVMaskField

class ViewController: UIViewController {
    
    @IBOutlet weak var maskTextField: TVMaskTextField!
    
    @IBOutlet weak var resultsTextField: TVMaskTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maskTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text as NSString? else { return true }
        let newText = oldText.replacingCharacters(in: range, with: string)
        
        if textField == maskTextField {
            resultsTextField.textMask = newText
        }
        return true
    }
}



