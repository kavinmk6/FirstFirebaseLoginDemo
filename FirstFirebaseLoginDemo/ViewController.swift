//
//  ViewController.swift
//  FirstFirebaseLoginDemo
//
//  Created by Kavin prabu Mohandass on 2021-10-31.
//

import UIKit
import FirebaseAuthUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: UIButton) {
        
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            
            return
        }
        
        authUI?.delegate = self
        
        let authUiViewController = authUI!.authViewController()
        
        present(authUiViewController, animated: true, completion: nil)

    }
    
    
}

extension ViewController: FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
       
        if error != nil{
            return
        }
        
        performSegue(withIdentifier: "goHome", sender: self)
    }
}

