//
//  ViewController.swift
//  NewProject
//
//  Created by Nurba Seyilkhan on 15.03.2022.
//

import UIKit
import FirebaseDatabase
import Firebase
import nanopb

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.dataSource = self
        }
    }
    
    private var partner: Partners?

    private var current: [PartnerID]?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.identifier)
        // Do any additional setup after loading the view.
    }

    func readFromFirebase(){
        var ref = Database.database().reference().child("currentPartner")
        ref.observe(.childAdded) { [weak self] (snapshot) in
            guard let value = snapshot.value as? [String:Any] else { return }
        if let name = value["name"] as? String, let desc = value["description"] as? String, let url = value["url"] as? String{
            let currentPartner = PartnerID(name: name, partnerIDDescription: desc, url: url)
            self?.current?.append(currentPartner)
            if let row = self?.current!.count{
                let indexPath = IndexPath(row: row - 1, section: 0)
                self?.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
   
        
        
    }
}

    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (partner?.currentPartners.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.partnerName.text = current?[indexPath.row].name
        return cell
    }
    
    
}
