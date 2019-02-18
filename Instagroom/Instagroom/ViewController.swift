//
//  ViewController.swift
//  Instagroom
//
//  Created by Denis Nefedov on 16/02/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /**
     Создаем кнопку с помощью closure
     */
    let plusPhotoBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "set_photo"), for: .normal)
        return btn
    }()
    
    let emailTextField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Email"
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        return fld
    }()
    
    let usernameField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Username"
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        return fld
    }()
    
    let passwordField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Enter password"
        fld.isSecureTextEntry = true
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        return fld
    }()
    
    
    let submitBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
//        btn.backgroundColor = UIColor(red: 149/255, green:  204/255, blue: 244/255, alpha: 1)
        btn.backgroundColor = UIColor.rgb(149, 204, 244)
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(plusPhotoBtn) // добавляем кнопку как subview
        plusPhotoBtn.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        plusPhotoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupInputFields()
    }
    
    fileprivate func setupInputFields() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,usernameField,passwordField, submitBtn])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
       
        stackView.anchor(top: plusPhotoBtn.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 200)
        
    }


}

