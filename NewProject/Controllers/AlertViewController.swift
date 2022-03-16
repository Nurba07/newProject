//
//  AlertViewController.swift
//  NewProject
//
//  Created by Nurba Seyilkhan on 16.03.2022.
//

import UIKit

class AlertViewController: UIViewController {
    @IBOutlet weak var indicatorView: UIView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let storyboard1 = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.layer.cornerRadius = 12
        self.indicator.startAnimating()
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            self.dismiss(animated: false) {
                weak var pvc = self.presentingViewController
                self.dismiss(animated: true, completion: {
                    let vc = TestViewController()
                    pvc?.
                })
            }
          
            
        }
        // Do any additional setup after loading the view.
    }
 

}
