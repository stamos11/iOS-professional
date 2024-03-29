//
//  LoginView.swift
//  Bankey
//
//  Created by stamoulis nikolaos on 3/11/23.
//

import Foundation
import UIKit


class LoginView: UIView {
    
    
    let stackview = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.enablePasswordToggle()
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
       
        
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func layout() {
        addSubview(stackview)
        stackview.addArrangedSubview(usernameTextField)
        stackview.addArrangedSubview(dividerView)
        stackview.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 1),
        ])
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}

extension  LoginView: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
  
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
      return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
