//
//  ViewController.swift
//  calculatorVika
//
//  Created by F1xTeoNtTsS on 23.05.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var holder: UIView!
    var firstNumber = 0
    var resultNumber = 0
    var currentOperations: Operation?
    
    enum Operation {
        case add,subtract,multiply,divide
    }
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 100)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNumberPad()
    }
    
    private func setupNumberPad() {
        let buttonSize:CGFloat = view.frame.size.width / 4
        let zeroButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height-buttonSize, width: buttonSize*3, height: buttonSize))
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        zeroButton.tag = 1
        zeroButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        holder.addSubview(zeroButton)
        
        
        //MARK: создание цифр от 1 до 9
        for x in 0..<3 {
            let buttonOne = UIButton(frame: CGRect(x:buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize*2), width: buttonSize, height: buttonSize))
            buttonOne.setTitleColor(.black, for: .normal)
            buttonOne.backgroundColor = .white
            buttonOne.setTitle("\(x+1)", for: .normal)
            buttonOne.tag = x+2
            //buttonOne.layer.cornerRadius = buttonSize / 2
            buttonOne.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(buttonOne)
        }
        
        for x in 0..<3 {
            let buttonTwo = UIButton(frame: CGRect(x:buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize*3), width: buttonSize, height: buttonSize))
            buttonTwo.setTitleColor(.black, for: .normal)
            buttonTwo.backgroundColor = .white
            buttonTwo.setTitle("\(x+4)", for: .normal)
            buttonTwo.tag = x+5
            //buttonTwo.layer.cornerRadius = buttonSize / 2
            buttonTwo.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(buttonTwo)
        }
        
        for x in 0..<3 {
            let buttonThree = UIButton(frame: CGRect(x:buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize*4), width: buttonSize, height: buttonSize))
            buttonThree.setTitleColor(.black, for: .normal)
            buttonThree.backgroundColor = .white
            buttonThree.setTitle("\(x+7)", for: .normal)
            buttonThree.tag = x+8
            //buttonThree.layer.cornerRadius = buttonSize / 2
            buttonThree.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
            holder.addSubview(buttonThree)
        }
        
        
        
        //      кнопка удаления
        let clearButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height-(buttonSize*5), width: view.frame.size.width-buttonSize, height: buttonSize))
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = .lightGray
        clearButton.setTitle("Clear ALL", for: .normal)
        clearButton.titleLabel?.font = UIFont(name: "Helvetica", size: 30)
        holder.addSubview(clearButton)
        
        //      боковая панель операций
        let operations = ["=","+","-","*","/"]
        for x in 0..<5 {
            let buttonFour = UIButton(frame: CGRect(x:buttonSize*3, y: holder.frame.size.height-(buttonSize*CGFloat(x+1)), width: buttonSize, height: buttonSize))
            buttonFour.setTitleColor(.white, for: .normal)
            buttonFour.backgroundColor = .orange
            buttonFour.setTitle(operations[x], for: .normal)
            holder.addSubview(buttonFour)
            buttonFour.tag = x+1
            buttonFour.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        }
        
        resultLabel.frame = CGRect(x: 20, y: clearButton.frame.origin.y - 110.0, width: view.frame.size.width-40, height: 100)
        holder.addSubview(resultLabel)
        
        // действия
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
    }
    
    @objc func clearResult() {
        resultLabel.text = "0"
        currentOperations = nil
        firstNumber = 0
    }
    
    @objc func numberPressed (_ sender:UIButton) {
        let tag = sender.tag-1
        if resultLabel.text == "0" {
            resultLabel.text = "\(tag)"
        }
        else if let text = resultLabel.text {
            resultLabel.text = "\(text)\(tag)"
            
        }
    }
    
    @objc func operationPressed (_ sender:UIButton) {
        let tag = sender.tag
        if let text = resultLabel.text, let value = Int(text), firstNumber == 0 {
            firstNumber = value
            resultLabel.text = "0"
        }
        
        
        if tag == 1 {
            if let operation = currentOperations {
                var secondNumber = 0
                if let text = resultLabel.text, let value = Int(text) {
                    secondNumber = value
                }
                switch operation {
                case .add:
                    let result = firstNumber + secondNumber
                    resultLabel.text = "\(result)"
                    break
                case .subtract:
                    let result = firstNumber - secondNumber
                    resultLabel.text = "\(result)"
                    break
                case .multiply:
                    let result = firstNumber * secondNumber
                    resultLabel.text = "\(result)"
                    break
                case .divide:
                    let result = firstNumber / secondNumber
                    resultLabel.text = "\(result)"
                    break
        
                }
            }
        }
        else if tag == 2 {
            currentOperations = .add
        }
        else if tag == 3 {
            currentOperations = .subtract
        }
        else if tag == 4 {
            currentOperations = .multiply
        }
        else if tag == 5 {
            currentOperations = .divide
        }
   
    }
}

