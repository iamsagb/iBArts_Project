//
//  FavouriteViewController.swift
//  iBArts_Project
//
//  Created by Sagar Bhosale on 22/05/22.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    let favourite: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
}

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourite.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        cell?.textLabel.text = favourite.title
        
        return cell!
    }


}
