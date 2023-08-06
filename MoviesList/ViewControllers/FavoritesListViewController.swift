//
//  FavoritesListViewController.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 6/8/2023.
//

import UIKit

class FavoritesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tbl_view:UITableView!
    
    private var favorites: [MoviesEntity] = []
    private let manager = DatabaseManger()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favorites = manager.fetchFavorites()
        
        if favorites.count == 0{
            Alerts.warningMessage(title: "Oops", body: "You don't have any Favorites.")
        }else{
            tbl_view.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false


        // Do any additional setup after loading the view.
    }
    

    //MARK: TABLEVIEW DATASOURCE***************

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MoviesCell
        
        movieCell.selectionStyle = .none
        movieCell.movieName_Lbl.text = favorites[indexPath.row].movie_title
        movieCell.releaseDate_Lbl.text = "Released "+(favorites[indexPath.row].release_date ?? "")
        movieCell.movieRatingLabel.text = String(format: "%.1f", favorites[indexPath.row].movie_rating)
        
        let originalString = "https://image.tmdb.org/t/p/original/\(favorites[indexPath.row].poster_path ?? "")"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        movieCell.moviePoster?.sd_setImage(with: URL(string: urlString ?? ""), placeholderImage: UIImage(named: "poster_placeholder"))
        return movieCell
        
    }
        
        //MARK: TABLEVIEW DELEGATES***************

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 160
            
            
        }

}
