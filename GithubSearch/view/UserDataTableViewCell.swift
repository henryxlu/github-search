//
//  UserDataTableViewCell.swift
//  GithubSearch
//
//  Created by Henry on 2019/7/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {

    @IBOutlet weak var githubImage: UIImageView!
    @IBOutlet weak var forkImage: UIImageView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var authorImage: UIImageView!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    //初始化方法
    //init from decoder
    //awake from nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        githubImage.image = UIImage(named: "author")
        forkImage.image = UIImage(named: "fork")
        likeImage.image = UIImage(named: "like")
        authorImage.image = UIImage(named: "author")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
