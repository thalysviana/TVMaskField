//
//  TVMaskTextField.swift
//  Pods
//
//  Created by Thalys Viana on 14/11/20.
//

import UIKit

public class TVMaskTextField: UITextField {
    private(set) var tvMaskString = TVMaskString()
    
    private weak var maskDelegate: UITextFieldDelegate?
    
    public override var delegate: UITextFieldDelegate? {
        get {
            maskDelegate
        }
        set {
            maskDelegate = newValue
            super.delegate = self
        }
    }
    
    public var unmaskedText: String {
        tvMaskString.unmask(entry: text ?? "")
    }
    
    @IBInspectable public var textMask: String {
        get {
            tvMaskString.stringMask
        }
        set {
            tvMaskString.stringMask = newValue
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public init(mask: String = "") {
        super.init(frame: .zero)
        textMask = mask
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        super.delegate = self
    }
}

extension TVMaskTextField: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        maskDelegate?.textFieldDidBeginEditing?(textField)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        maskDelegate?.textFieldDidEndEditing?(textField)
    }

    @available(iOS 13.0, *)
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        maskDelegate?.textFieldDidChangeSelection?(textField)
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        maskDelegate?.textFieldShouldClear?(textField) ?? true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        maskDelegate?.textFieldShouldReturn?(textField) ?? true
    }

    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        maskDelegate?.textFieldShouldEndEditing?(textField) ?? true
    }

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        maskDelegate?.textFieldShouldEndEditing?(textField) ?? true
    }

    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        maskDelegate?.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let _ = maskDelegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string)
        
        guard let oldText = textField.text as NSString? else { return false }
        let newText = oldText.replacingCharacters(in: range, with: string)
        let strOldText = oldText as String
        
        let newTextMasked = TVMaskString(stringMask: tvMaskString.stringMask).mask(entry: newText)
        let oldTextMasked = TVMaskString(stringMask: tvMaskString.stringMask).mask(entry: strOldText)
        
        let offset = tvMaskString.offsetFor(previousValue: oldTextMasked, currentValue: newTextMasked)

        if let selectedRange = textField.selectedTextRange {
            textField.text = newTextMasked
            if let newPosition = textField.position(from: selectedRange.start, offset: offset) {
                textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
                return false
            }
        }
        return true
    }
}
