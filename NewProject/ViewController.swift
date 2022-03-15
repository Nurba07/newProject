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
    let ref = Database.database().reference(withPath: "currentPartners")

    var current = [PartnerID]()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.nib, forCellReuseIdentifier: MainTableViewCell.identifier)
        readFromFirebase()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
    }

    func readFromFirebase(){

        ref.observe(.value) { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let childObject = child.value as! [String : AnyObject]
                let name = childObject["name"]
                let desc = childObject["description"]
                let url = childObject["url"]
                
                let snap = PartnerID(name: (name as! String?)!, partnerIDDescription: (desc as! String?)!, url: (url as! String?)!)
                self.current.append(snap)
          }
            self.tableView.reloadData()
        }
}
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return current.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.partnerName.text = current[indexPath.row].name
        cell.url.text = current[indexPath.row].url
        cell.desc.text = current[indexPath.row].partnerIDDescription
        return cell
    }
    
    
}
