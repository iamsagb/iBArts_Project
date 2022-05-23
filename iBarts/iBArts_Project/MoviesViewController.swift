//
//  MoviesViewController.swift
//  iBArts_Project
//
//  Created by ashutosh deshpande on 23/05/2022.
//

import UIKit
import Foundation

class MoviesViewController: UIViewController {
    var movies: Movies?

    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        // Do any additional setup after loading the view.
    }
    
    func parseJson() {
        let str = "https://api.themoviedb.org/3/movie/now_playing?api_key=86f896e67a3086d0fb6f497460b51c36&language=en-US&page=1"
        let url = URL(string: str)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            do{
                self.movies = try JSONDecoder().decode(Movies.self, from: data!)

                DispatchQueue.main.async {
                    self.moviesTableView.reloadData()
                }

            } catch let error {
                print("Error is here\(error)")
            }
        }.resume()
    }

}
    
    
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.results.count ?? 0
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MoviesListTableViewCell

        cell.titleLabel.text = movies?.results[indexPath.row].originalTitle

//        MARK: Convertion of URL to Image
//        let url = posterLink
//        let imagedata = try! Data(contentsOf: URL(string: url)!)
//        cell.postImage.image = UIImage(data: imagedata)
        return cell
    }

//
//    func tableView(_ tableView: UITableView,
//                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let action = UIContextualAction(style: .normal,
//                                        title: "Favourite") { [weak self] (action, view, completionHandler) in
//                                            self?.handleMarkAsFavourite()
//                                            completionHandler(true)
//            action.backgroundColor = .systemYellow
//
//            let archive = UIContextualAction(style: .normal,
//                                             title: "archive") { [weak self] (action, view, completionHandler) in
//                                                self?.handleMoveToArchive()
//                                                completionHandler(true)
//
//
//        } favourite.backgroundColor = .systemYellow
//
//    }



}





/* generated API link https://api.themoviedb.org/3/movie/now_playing?api_key=86f896e67a3086d0fb6f497460b51c36&language=en-US&page=1
*/
