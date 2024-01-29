//
//  ViewController.swift
//
//
//  Created by tobihige on 2024/01/28.
//

import UIKit

class ViewController: UIViewController {
    
    private var newButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("pulse", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        
        return button
    }()
    
    private var widthConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(newButton)
        
        newButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        widthConstraint = newButton.widthAnchor.constraint(equalToConstant: 60)
        
        guard let widthConstraint = widthConstraint else { return }
        
        NSLayoutConstraint.activate([
            newButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1.0),
            newButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 1.0),
            widthConstraint,
            newButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func buttonTapped() {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.newButton.backgroundColor = .systemPink
            self.widthConstraint?.isActive = false
            
            self.newButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            self.view.layoutIfNeeded()
            
        }) { _ in
            let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
                pulseAnimation.duration = 0.6
                pulseAnimation.fromValue = 1.0
                pulseAnimation.toValue = 1.1
                pulseAnimation.autoreverses = true
                pulseAnimation.repeatCount = .infinity
                self.newButton.layer.add(pulseAnimation, forKey: "pulse")
        }
    }


}

