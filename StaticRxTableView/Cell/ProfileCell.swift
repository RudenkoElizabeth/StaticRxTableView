//
//  ProfileCell.swift
//  StaticRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!

    func setupNameLabel(_ text: String?) {
        nameLabel.text = text
    }

    func setupLocationLabel(_ text: String?) {
        locationLabel.text = text
    }

    func setupUser(image: UIImage?) {
        userImageView.image = image
    }
}
