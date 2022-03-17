//
//  SpiningViewController.swift
//  NewProject
//
//  Created by Nurba Seyilkhan on 16.03.2022.
//

import UIKit

class SpiningViewController: UIViewController {

    let rotatingView = RotatingIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRotating()
        view.backgroundColor = .white
        rotatingView.animate(circle: rotatingView.circle1, counter: 1)
        rotatingView.animate(circle: rotatingView.circle2, counter: 3)
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            self.rotatingView.removeFromSuperview()
        }
    }

    private func configureRotating(){
        view.addSubview(rotatingView)
        
        NSLayoutConstraint.activate([
            rotatingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rotatingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rotatingView.heightAnchor.constraint(equalToConstant: 100),
            rotatingView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}
