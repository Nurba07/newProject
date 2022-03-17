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
    }

}
