//
//  LoginViewController.swift
//  iTask
//
//  Created by Assan Kabayev on 22.01.2023.
//

import UIKit
import Combine

class LoginViewController: UIViewController, Animatable {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @Published var errorString: String = ""
    @Published var isLoginSuccessful = false
    
    weak var delegate: LoginVSDelegate?
    
    private var subscribers = Set<AnyCancellable>()
    private let authManager = AuthManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeForm()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    private func observeForm(){
        $errorString.sink { [unowned self] (errorMessage) in
            self.errorLabel.text = errorMessage
        }.store(in: &subscribers)
        
        $isLoginSuccessful.sink { [unowned self] (isSuccessful) in
            if isSuccessful{
                self.delegate?.didLogin()
            }
        }.store(in: &subscribers)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton){
        
        guard let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
            else {
            errorString = "Incomplete form"
            return}
        
        errorString = ""
        showLoadingAnimation()
        
        authManager.login(withEmail: email, password: password) { [weak self] (result) in
            self?.hideLoadingAnimation()
            switch result{
            case .success:
                self?.isLoginSuccessful = true
            case .failure(let error):
                self?.errorString = error.localizedDescription
            }
        }
//        showLoadingAnimation()
//
//        let email = "assan@test.com"
//        let password = "12345678"
//
//        authManager.login(withEmail: email, password: password) { [weak self] (result) in
//            self?.hideLoadingAnimation()
//            switch result{
//            case .success:
//                self?.delegate?.didLogin()
//            case .failure(let error):
//                self?.showToast(state: .error, message: error.localizedDescription, duration: 3.0)
//            }
//        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton){
        
        guard let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
            else {
            errorString = "Incomplete form"
            return}
        
        errorString = ""
        showLoadingAnimation()
        
        authManager.signUp(withEmail: email, password: password) { [weak self] (result) in
            self?.hideLoadingAnimation()
            switch result{
            case .success:
                self?.isLoginSuccessful = true
            case .failure(let error):
                self?.errorString = error.localizedDescription
            }
        }
//        showLoadingAnimation()
//
//        let email = "nuri@test.com"
//        let password = "87654321"
//
//        authManager.login(withEmail: email, password: password) { [weak self] (result) in
//            self?.hideLoadingAnimation()
//            switch result{
//            case .success:
//                self?.delegate?.didLogin()
//            case .failure(let error):
//                self?.showToast(state: .error, message: error.localizedDescription, duration: 3.0)
//            }
//        }
    }
    
}
