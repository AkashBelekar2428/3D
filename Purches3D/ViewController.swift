//
//  ViewController.swift
//  Purches3D
//
//  Created by Akash Belekar on 03/08/23.
//

import UIKit

struct photoes{
    var img: String
}

class ViewController: UIViewController {
    @IBOutlet weak var tblView:UITableView!
    
    let imgArray = [UIImage(named: "shoes3D")]

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: "TVC", bundle: nil), forCellReuseIdentifier: "TVC")
        tblView.dataSource = self
        tblView.delegate = self
        tblView.separatorStyle = .none
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVC", for: indexPath) as! TVC
        cell.img.image = imgArray[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.9660720229, green: 0.9660720229, blue: 0.9660720229, alpha: 1)
        cell.img.translatesAutoresizingMaskIntoConstraints = false
        cell.img.centerXAnchor.constraint(equalTo: tblView.centerXAnchor).isActive = true
        cell.img.centerYAnchor.constraint(equalTo: tblView.centerYAnchor).isActive = true
//        UIView.animate(withDuration: 2.0, animations: {
//            cell.img.transform = cell.img.transform.rotated(by: CGFloat(Double.pi))
//        })
    let rotate = UIViewPropertyAnimator(duration: 5, curve: .linear, animations: {
            cell.img.transform = cell.img.transform.rotated(by: CGFloat(Double.pi))

        })
        rotate.startAnimation()
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
}
