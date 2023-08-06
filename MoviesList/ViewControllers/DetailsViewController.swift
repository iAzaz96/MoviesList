//
//  DetailsViewController.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 5/8/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
  ///Movies Data *********
    var moviesData:Movies?
    ////
    
    @IBOutlet weak var movieName_Lbl:UILabel!
    @IBOutlet weak var moviePoster:UIImageView!
    @IBOutlet weak var movieRatingLabel:UILabel!
    @IBOutlet weak var movie_Summary_Lbl:UILabel!
    @IBOutlet weak var vote_Count_Lbl:UILabel!
    @IBOutlet weak var release_label_Lbl:UILabel!
    
    @IBOutlet weak var my_fvrts_btn:UIButton!

    private let manager = DatabaseManger()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false

        
        my_fvrts_btn.layer.cornerRadius = 5.0
        
        title = "Details"
        
        movieName_Lbl.text = moviesData?.originalTitle
        movieRatingLabel.text = String(format: "%.1f", moviesData?.voteAverage ?? 0.0)
        movie_Summary_Lbl.text = moviesData?.overview
        vote_Count_Lbl.text = "\(moviesData?.voteCount ?? 0)"
        
        let originalString = "https://image.tmdb.org/t/p/original/\(moviesData?.posterPath ?? "" )"
            let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        moviePoster?.sd_setImage(with: URL(string: urlString ?? ""), placeholderImage: UIImage(named: "poster_placeholder"))
        
        
        //Split year from the release date////
        let releasedYear = moviesData?.releaseDate.components(separatedBy: "-")
        release_label_Lbl.text = "\(releasedYear?[0] ?? "") - R18+"

    }
    
    
    ///Add to Favorites Action**********
    @IBAction func addFavorite(){
        
        let favorites = FavoriteModel(
            movie_title: moviesData?.originalTitle ?? "",
            poster_path: moviesData?.posterPath ?? "",
            release_date: moviesData?.releaseDate ?? "",
            rating_average: moviesData?.voteAverage ?? 0.0)
        
        manager.addFavorite(favorites)
        
    }
    
    ///Navigate to Favorites Action**********
    @IBAction func goToFavorite(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavoritesView") as! FavoritesListViewController
        self.navigationController?.pushViewController(mainVC, animated: true)
    }

}



//MARK: COLLECTION VIEW ****************************

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource   {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesData?.genres.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let genreCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCell", for: indexPath) as! GenreCollectionCell
        
        genreCell.layer.borderColor = UIColor.lightGray.cgColor
        genreCell.layer.borderWidth = 0.5
        
        genreCell.layer.cornerRadius = 3
        
        genreCell.genreLabel.text = moviesData?.genres[indexPath.item].name ?? ""
        
        return genreCell
    }
    
    
    
    
    
}
