//
//  ViewController.swift
//  SimpeNumberCounter
//
//  Created by GO on 2/21/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var currentNumber = {
        let num = UILabel()
        num.text = "\(count)"
        num.textAlignment = .center
        num.font = .boldSystemFont(ofSize: 24)
        return num
    }()
    
    private let plusButton = {
        let plus = UIButton()
        plus.setTitle("+", for: .normal)
        plus.setTitleColor(.black, for: .normal)
        plus.layer.cornerRadius = 10
        plus.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        plus.layer.borderColor = UIColor.black.cgColor
        plus.layer.borderWidth = 1
        plus.clipsToBounds = true
        return plus
    }()
    private let minusButton = {
        let minus = UIButton()
        minus.setTitle("-", for: .normal)
        minus.setTitleColor(.black, for: .normal)
        minus.layer.cornerRadius = 10
        minus.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        minus.layer.borderColor = UIColor.black.cgColor
        minus.layer.borderWidth = 1
        minus.clipsToBounds = true
        return minus
    }()
    private let resetButton = {
        let reset = UIButton()
        reset.setTitle("RESET", for: .normal)
        reset.setTitleColor(.black, for: .normal)
        reset.layer.cornerRadius = 10
        reset.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        reset.layer.borderColor = UIColor.black.cgColor
        reset.layer.borderWidth = 1
        reset.clipsToBounds = true
        return reset
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [plusButton, minusButton, resetButton])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        setAction()
    }

    @objc func plusButtonClicked() {
        count += 1
        currentNumber.text = "\(count)"
    }
    
    @objc func minusButtonClicked() {
        count -= 1
        currentNumber.text = "\(count)"
    }
    
    @objc func resetButtonClicked() {
        count = 0
        currentNumber.text = "\(count)"
    }
}

extension ViewController {
    
    private func setUI() {
        view.backgroundColor = .white
        
        [currentNumber, buttonStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setConstraints() {
        currentNumber.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(currentNumber.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
    }
    
    private func setAction() {
        plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonClicked), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonClicked), for: .touchUpInside)
    }
    
}
