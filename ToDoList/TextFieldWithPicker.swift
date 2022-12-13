//
//  TextFieldWithPicker.swift
//  ToDoList
//
//  Created by F1xTeoNtTsS on 08.07.2021.
//

import UIKit

class TextFieldWithPicker: UITextField {

    private let pickerView =  UIPickerView(frame: .zero)
    private var lastSelectedRow: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.inputView = self.pickerView
    }
}


extension TextFieldWithPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Hello"
    }
    
    
    
}
