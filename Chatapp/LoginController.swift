//
//  LoginController.swift
//  Chatapp
//
//  Created by Majid Osman on 2018-11-25.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit
import Firebase
class LoginController: UIViewController {
    
    
    let ProFileImageView : UIImageView = {
    let ProfileImageView = UIImageView()
    ProfileImageView.image = UIImage(named: "icons8-user-filled-50")
        ProfileImageView.backgroundColor = UIColor.rgb(200, 214, 229)
    ProfileImageView.layer.cornerRadius = 40
    ProfileImageView.layer.masksToBounds = true
    return ProfileImageView
    }()
    
    lazy var LoginRegisterSegmentedController: UISegmentedControl = {
    let LoginRegisterSegmented = UISegmentedControl(items: ["Login", "Register"])
        LoginRegisterSegmented.tintColor = .white
        LoginRegisterSegmented.backgroundColor = UIColor.rgb(34, 47, 62)
        LoginRegisterSegmented.selectedSegmentIndex = 1
        LoginRegisterSegmented.addTarget(self, action: #selector(handleSegmentedController), for: .valueChanged)
        LoginRegisterSegmented.translatesAutoresizingMaskIntoConstraints = false
        return LoginRegisterSegmented
    }()
    @objc func handleSegmentedController (){
        let title = LoginRegisterSegmentedController.titleForSegment(at: LoginRegisterSegmentedController.selectedSegmentIndex)
        RegisterLoginButton.setTitle(title, for: .normal)
        
        InputsContainerViewheighAnchor?.constant = LoginRegisterSegmentedController.selectedSegmentIndex == 0 ? 140 : 180
        UserNameTextfieldheighAnchor?.isActive = false
        UserNameTextfieldheighAnchor = UserNameTextfield.heightAnchor.constraint(equalTo: Input.heightAnchor, multiplier: LoginRegisterSegmentedController.selectedSegmentIndex == 0 ? 0 : 1/3);UserNameTextfieldheighAnchor?.isActive = true
    }
    
    let Input : UIView = {
    let input = UIView()
    input.backgroundColor = .white
    input.layer.cornerRadius = 30
    input.layer.masksToBounds = true
    return input
    }()
    
    let UserNameTextfield : UITextField = {
    let usernameTextfield = UITextField()
    usernameTextfield.placeholder = "Name"
    usernameTextfield.font = UIFont.boldSystemFont(ofSize: 20)
    usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
    return usernameTextfield
    }()
    
  
    
    let EmailTextfield : UITextField = {
        let EmailTextfield = UITextField()
        EmailTextfield.placeholder = "Email"
        EmailTextfield.font = UIFont.boldSystemFont(ofSize: 20)
        return EmailTextfield
    }()
    let PasswordTextfield : UITextField = {
        let passwordTextfield = UITextField()
        passwordTextfield.placeholder = "Password"
        passwordTextfield.font = UIFont.boldSystemFont(ofSize: 20)
        passwordTextfield.isSecureTextEntry = true
        return passwordTextfield
    }()
    
    lazy var RegisterLoginButton : UIButton = {
    let registerloginButton = UIButton(type: .system)
    registerloginButton.addTarget(self, action: #selector(HandleRegister), for: .touchUpInside)
    registerloginButton.setTitle("Register", for: .normal)
    registerloginButton.backgroundColor = UIColor.rgb(200, 214, 229)
    registerloginButton.tintColor = .black
    registerloginButton.layer.cornerRadius = 20
      return registerloginButton
    }()
    
    @objc func HandleRegister(){
        guard let email = EmailTextfield.text, let password = PasswordTextfield.text, let name = EmailTextfield.text else {
            print("Form is not valid")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: { (res, error) in
            if let error = error {
                print(error)
                return
            }
            guard let uid = res?.user.uid else {
                return
            }
            //successfully authenticated user
            let ref = Database.database().reference(fromURL: "https://chatapp-35a28.firebaseio.com/")
            let usersReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email]
            usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if let err = err {
                    print(err)
                    return
                }
                print("Saved user successfully into Firebase db")
            })
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          SetupView()
        view.backgroundColor = UIColor(red: 127/255, green: 143/255, blue: 166/255, alpha: 1.0)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
// NSLayout Constraint variable. have been used in segmented controller as well in the setup view anchors specifically in the UserNameTextfiel, InputsContainer or Input & User Name Text field,
//    Password and email Text field.
    
    var InputsContainerViewheighAnchor : NSLayoutConstraint?
    var UserNameTextfieldheighAnchor: NSLayoutConstraint?
    var PasswordTextfieldheighAnchor: NSLayoutConstraint?
    var EmailTextfielddheighAnchor: NSLayoutConstraint?
    func   SetupView(){
         view.addSubview(Input)
         view.addSubview(UserNameTextfield)
         view.addSubview(EmailTextfield)
         view.addSubview(PasswordTextfield)
         view.addSubview(RegisterLoginButton)
         view.addSubview(ProFileImageView)
         view.addSubview(LoginRegisterSegmentedController)
    
//        Inputs Container View heigh Anchor
        InputsContainerViewheighAnchor = Input.heightAnchor.constraint(equalToConstant: 180);InputsContainerViewheighAnchor?.isActive = true
      Input.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 250, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 180)
        
        //  UserName Text field heigh Anchor
        UserNameTextfieldheighAnchor = UserNameTextfield.heightAnchor.constraint(equalToConstant: 1/3);UserNameTextfieldheighAnchor?.isActive = true
        UserNameTextfield.anchor(top: Input.topAnchor, left: Input.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        //  Email Text field heigh Anchor
         EmailTextfielddheighAnchor = EmailTextfield.heightAnchor.constraint(equalToConstant: 1/3);EmailTextfielddheighAnchor?.isActive = true
        EmailTextfield.anchor(top: UserNameTextfield.bottomAnchor, left: Input.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
// Password Text field heigh Anchor
        PasswordTextfieldheighAnchor = PasswordTextfield.heightAnchor.constraint(equalToConstant: 1/3);PasswordTextfieldheighAnchor?.isActive = true
        PasswordTextfield.anchor(top: EmailTextfield.bottomAnchor, left: Input.leftAnchor, bottom: Input.bottomAnchor, right: nil, topConstant: 15, leftConstant: 20, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        
        RegisterLoginButton.anchor(top: Input.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 80, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 50)
        

        ProFileImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: Input.topAnchor, right: nil, topConstant: 160, leftConstant: 170, bottomConstant: 10, rightConstant: 0, widthConstant: 70, heightConstant: 80)
        
        
LoginRegisterSegmentedController.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 50)
    }
    
}


