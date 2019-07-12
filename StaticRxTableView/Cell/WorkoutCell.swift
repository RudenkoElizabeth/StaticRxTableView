//
//  WorkoutCell.swift
//  StaticRxTableView
//
//  Created by Elizabeth Rudenko on 29/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class WorkoutCell: UITableViewCell {
    @IBOutlet weak var firstValueLabel: UILabel!
    @IBOutlet weak var firstMeasureLabel: UILabel!
    @IBOutlet weak var secontValueLabel: UILabel!
    @IBOutlet weak var secondMeasureLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        firstValueLabel.text = nil
        firstMeasureLabel.text = nil
        secontValueLabel.text = nil
        secondMeasureLabel.text = nil
    }

    func setupFirstValueLabel(_ text: String?) {
        firstValueLabel.text = text
    }

    func setupFirstMeasureLabel(_ text: String?) {
        firstMeasureLabel.text = text
    }

    func setupSecondValueLabel(_ text: String?) {
        secontValueLabel.text = text
    }

    func setupSecondMeasureLabel(_ text: String?) {
        secondMeasureLabel.text = text
    }
}
