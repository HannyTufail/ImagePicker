//
//  DetailsViewController.swift
//  ImagePicker
//
//  Created by zaktech on 5/3/16.
//  Copyright © 2016 zaktech. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var titleString : String?
    
    
    var secure : Bool = false { didSet { updateUI() }}
    var loggedInUser: User? { didSet { updateUI() }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleString
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI(){
        
        passwordTextField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secured Password" : "Password"
        nameLabel.text = loggedInUser?.name
        companyLabel.text = loggedInUser?.company
        image = loggedInUser?.image
    }
    
    @IBAction func loginButtonTapped() {
        
        loggedInUser = User.login( usernameTextField.text ?? "" ,
                                  password: passwordTextField.text ?? "")
    }
    
    @IBAction func changeSecurityButtonTapped() {
        secure = !secure
    }
    
    
    var image: UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            
            if let constrainedView = imageView {
                if let newImage = newValue {
                    aspectRationConstraint = NSLayoutConstraint (
                        item: constrainedView,
                        attribute: .Width,
                        relatedBy: .Equal,
                        toItem: constrainedView,
                        attribute: .Height,
                        multiplier: newImage.aspectRatio,
                        constant: 0
                    )
                }
                else {
                    aspectRationConstraint = nil
                }
            }
        }
    }
    
    
    var aspectRationConstraint: NSLayoutConstraint? {
        willSet {
            if let existingConstraints = aspectRationConstraint {
                view.removeConstraint(existingConstraints)
            }
        }
        didSet{
            if let newConstraint = aspectRationConstraint {
                view.addConstraint(newConstraint)
            }
        }
    }
}

extension User {
    var image : UIImage? {
        if let image = UIImage(named: login){
            return image
        }
        else {
            return UIImage(named: "unknown_user")
        }
    }
}

extension UIImage {
    var aspectRatio: CGFloat {
        return size.height == 0 ? 0 : size.width / size.height
    }
}

