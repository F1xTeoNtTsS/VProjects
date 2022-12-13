//
//  FemaleUnderwear.swift
//  ToDoList
//
//  Created by F1xTeoNtTsS on 08.07.2021.
//

import UIKit

class FemaleUnderwear: UIViewController {

    
    let sizes = [1...300]
    let sizesPickerView = UIPickerView()
    
    let fullBustLabel: SizesLabel = {
        let label = SizesLabel(title: "Enter your Fullbust Size:")
        label.textColor = .black
        return label
    }()
    
    let underBustLabel: SizesLabel = {
        let label = SizesLabel(title: "Enter your Underbust Size:")
        return label
    }()
    
    let waistLabel: SizesLabel = {
        let label = SizesLabel(title: "Enter your Waist Size:")
        return label
    }()
    
    let hipsLabel: SizesLabel = {
        let label = SizesLabel(title: "Enter your Hips Size:")
        return label
    }()
    
    let textFieldFullBustSize: UITextField = {
        let fullBustSizeTF = UITextField()
        return fullBustSizeTF
    }()
    
    let textFieldUnderBustSize: UITextField = {
        let underBustSizeTF = UITextField()
        
        return underBustSizeTF
    }()
    
    let textFieldWaistSize: UITextField = {
        let waistSizeTF = UITextField()
        
        return waistSizeTF
    }()
    
    let textFieldHipsSize: UITextField = {
        let hipsSizeTF = UITextField()
        
        return hipsSizeTF
    }()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        textFieldFullBustSize.inputView = sizesPickerView
        textFieldUnderBustSize.inputView = sizesPickerView
        textFieldWaistSize.inputView = sizesPickerView
        textFieldHipsSize.inputView = sizesPickerView
        
        
        sizesPickerView.dataSource = self
        sizesPickerView.delegate = self

        setupConstraints()
    }
    

    func setupConstraints() {
        let stack = UIStackView(arrangedSubviews: [fullBustLabel,textFieldFullBustSize,underBustLabel, textFieldUnderBustSize,waistLabel, textFieldWaistSize, hipsLabel, textFieldHipsSize])
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: 250).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
    }

}


extension FemaleUnderwear: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(sizes[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    }
}
