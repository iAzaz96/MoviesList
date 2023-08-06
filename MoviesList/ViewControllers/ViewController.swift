//
//  ViewController.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 3/8/2023.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var movies_list:Movies?
    
    @IBOutlet weak var my_fvrts_btn:UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        my_fvrts_btn.layer.cornerRadius = 5.0

        self.navigationController?.navigationBar.isHidden = true
        
        if Connectivity.isConnectedToInternet{
                self.movies_api_request()
        }else{
            Alerts.showInternetMessage()
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    ///Navigate to Favorites Action**********
    @IBAction func goToFavorite(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavoritesView") as! FavoritesListViewController
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    
//MARK: MOVIE DB API REQUEST**************
    
    func movies_api_request(){
        self.startLoading()
        
        let urlString = API_Manager.movie_list_api+API_KEY
        
        AF.request(urlString, method: .get, parameters: nil, headers: nil).responseDecodable(of: Movies.self) { (response) in
            switch response.result{
            case .success(let value):
                self.movies_list = value
                self.tableView.reloadData()
                self.stopLoading()
                print(value)
            case .failure(let error):
                print(error.localizedDescription)
                Alerts.showServerErrorMessage()
                self.stopLoading()

            }
            
            
        }
    }
    /////END



//MARK: TABLEVIEW DATASOURCE***************

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MoviesCell
    
    movieCell.selectionStyle = .none
    movieCell.movieName_Lbl.text = movies_list?.originalTitle ?? ""
    movieCell.releaseDate_Lbl.text = "Released "+(movies_list?.releaseDate ?? "")
    movieCell.movieRatingLabel.text = String(format: "%.1f", movies_list?.voteAverage ?? 0.0)
    
    let originalString = "https://image.tmdb.org/t/p/original/\(movies_list?.posterPath ?? "" )"
        let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    movieCell.moviePoster?.sd_setImage(with: URL(string: urlString ?? ""), placeholderImage: UIImage(named: "poster_placeholder"))
    return movieCell
    
}
    
    //MARK: TABLEVIEW DELEGATES***************

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailView") as! DetailsViewController
        mainVC.moviesData = movies_list
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
        
    }

}


extension UIViewController: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
