//
//  OnboardingViewController.swift
//  iTask
//
//  Created by Assan Kabayev on 22.01.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let navigationManager = NavigationManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showLoginScreen", let destination = segue.destination as? LoginViewController {
            destination.delegate = self
        }
        
    }
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton){
        performSegue(withIdentifier: "showLoginScreen", sender: nil)
    }
    
}

extension OnboardingViewController: LoginVSDelegate{
    
    
    
    func didLogin() {
        
        presentedViewController?.dismiss(animated: true, completion: { [unowned self] in
            self.navigationManager.show(scene: .tasks)
        })
    }
    
    
}
