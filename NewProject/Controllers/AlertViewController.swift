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
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.layer.cornerRadius = 12
        self.indicator.startAnimating()
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            self.dismiss(animated: false, completion: nil)
            
        }
        // Do any additional setup after loading the view.
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
