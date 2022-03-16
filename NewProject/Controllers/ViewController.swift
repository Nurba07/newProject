//
//  ViewController.swift
//  NewProject
//
//  Created by Nurba Seyilkhan on 15.03.2022.
//

import UIKit
import FirebaseDatabase
import nanopb
import FirebaseStorage

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            self.tableView.dataSource = self
        }
    }
    @IBOutlet weak var toIndicator: UIBarButtonItem!
    let ref = Database.database().reference(withPath: "currentPartners")
    var current = [PartnerID]()
    var storage: Storage!
    
    
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

    @IBAction func toIndicatorPressed(_ sender: Any) {
        let vc = SpiningViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func readFromFirebase(){

        let userPostRefer = Storage.storage().reference().child("images")
        ref.observe(.value) { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let childObject = child.value as! [String : AnyObject]
                let name = childObject["name"]
                let url = childObject["url"]
                let logo = childObject["logo"]
                
                let snap = PartnerID(name: (name as! String?)!, url: (url as! String?)!, logo: logo as! String)
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
        cell.partnerName.text = current[indexPath.row].name.localized()
        cell.url.text = current[indexPath.row].url
        let urlString = current[indexPath.row].logo!
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

              if error != nil {
                  print(error ?? "No Error")
                  return
              }
              DispatchQueue.main.async(execute: { () -> Void in
                  let image = UIImage(data: data!)
                  cell.logo.image = image
              })

          }).resume()
        return cell
    }
    
    
}
extension String{
    func localized() -> String{
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
