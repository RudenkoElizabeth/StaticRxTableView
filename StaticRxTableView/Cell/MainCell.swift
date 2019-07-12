//
//  MainCell.swift
//  StaticRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
    }

    func setupTitleLabel(_ text: String?) {
        titleLabel.text = text
    }

    func setupSubtitleLabel(_ text: String?) {
        subtitleLabel.text = text
    }
}
