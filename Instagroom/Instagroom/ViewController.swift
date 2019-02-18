//
//  ViewController.swift
//  Instagroom
//
//  Created by Denis Nefedov on 16/02/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    /**
     Создаем кнопку с помощью closure
     */
    let plusPhotoBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "set_photo"), for: .normal)
        btn.imageView?.layer.cornerRadius = 5
        
        return btn
    }()
    
    let emailTextField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Email"
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        
        fld.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return fld
    }()
    
    let usernameField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Username"
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        
        fld.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return fld
    }()
    
    let passwordField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Enter password"
        fld.isSecureTextEntry = true
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        
        fld.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
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
        
        btn.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        btn.isEnabled = false
        return btn
    }()
    
    @objc func handleSignUp() {
        
        guard let email = emailTextField.text, email.count > 0 else { return }
        guard let login = usernameField.text, login.count > 0 else { return }
        guard let pass = passwordField.text, pass.count > 0  else { return }
        
        Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
            if let err = error {
                print("error in signup occured: ", err)
                return
            }
            print("Successfully created user: ", result?.user.uid ?? "")
            
            
            let usernames = ["username":login]
            guard let uid = result?.user.uid else { return }
            let values = [uid:usernames]
            /// saving our users to firebase database
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if let error = err {
                    print("Failed to save user info into DB", error)
                    return
                } else {
                    print("Successfully saved user info into DB")
                }
            })
        }
    
    }
    
    
    @objc func handleTextInputChange() {
        //TODO: add more checks for passwd and email
        let isValidFields = emailTextField.text?.count ?? 0 > 0 &&
                            usernameField.text?.count ?? 0 > 0 &&
                            passwordField.text?.count ?? 0 > 0
        
        if isValidFields {
            submitBtn.isEnabled = true
            submitBtn.backgroundColor = UIColor.rgb(17, 154, 237)
        } else {
            submitBtn.isEnabled = false
            submitBtn.backgroundColor = UIColor.rgb(149, 204, 244)
        }
    }
    
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

