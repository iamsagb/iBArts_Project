//
//  ViewController.swift
//  iBArts_Project
//
//  Created by Sagar Bhosale on 21/05/22.
//
import UIKit
import Foundation
import XCTest

class ViewController: UIViewController {
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJson()
    }
    
 

    
    func parseJson() {
        let str = "https://api.themoviedb.org/3/movie/now_playing?api_key=86f896e67a3086d0fb6f497460b51c36&language=en-US&page=1"
        let url = URL(string: str)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            do{
                self.movies = try JSONDecoder().decode(Movies.self, from: data!)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            } catch let error {
                print("Error is here"/ (error))
            }
        }.resume()
    }

}



/* generated API link https://api.themoviedb.org/3/movie/now_playing?api_key=86f896e67a3086d0fb6f497460b51c36&language=en-US&page=1
*/
