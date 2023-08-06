//
//  MoviesCell.swift
//  MoviesList
//
//  Created by Azaz Ur Rehman on 5/8/2023.
//

import UIKit

class MoviesCell: UITableViewCell {
    
    @IBOutlet weak var movieName_Lbl:UILabel!
    @IBOutlet weak var moviePoster:UIImageView!
    @IBOutlet weak var movieRatingLabel:UILabel!
    @IBOutlet weak var releaseDate_Lbl:UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
