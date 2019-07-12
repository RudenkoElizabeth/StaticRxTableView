//
//  ViewController.swift
//  StaticRxTableView
//
//  Created by Elizabeth Rudenko on 28/03/2019.
//  Copyright © 2019 Elizabeth Rudenko. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    private func setupDataSource() {
        typealias Section = AnimatableSectionModel<Int, Constants.CellType>
        let rxDataSource = RxTableViewSectionedAnimatedDataSource<Section>(
            configureCell: { [weak self] _, _, _, item in
                let cellType = Constants.CellType(rawValue: item.rawValue)!
                let cell = self?.setupCell(cellType)
                return cell!
        })
        Observable<[Constants.CellType]>
            .just([.profile,
                   .distanceCalories,
                   .timeSpeed,
                   .stepsFloors,
                   .startDate,
                   .endDate,
                   .location])
            .map { [Section(model: 0, items: $0)] }
            .bind(to: tableView.rx.items(dataSource: rxDataSource))
            .disposed(by: disposeBag)
    }

    private func setupCell(_ cellType: Constants.CellType) -> UITableViewCell {
        switch cellType {
        case .profile:
            return setupProfileCell()
        case .stepsFloors, .distanceCalories, .timeSpeed:
            return setupWorkoutCell(cellType)
        case .startDate, .endDate, .location:
            return setupMainCell(cellType)
        }
    }

    private func setupProfileCell() -> ProfileCell {
        let identifier = Constants.getCellIdentifier(.profile)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ProfileCell
        cell.setupUser(image: UIImage(named: Constants.userImage))
        cell.setupNameLabel(Constants.title[.profile])
        cell.setupLocationLabel(Constants.subtitle[.profile])
        return cell
    }

    private func setupWorkoutCell(_ cellType: Constants.CellType) -> WorkoutCell {
        let identifier = Constants.getCellIdentifier(cellType)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! WorkoutCell
        cell.setupFirstValueLabel(Constants.firstValue[cellType])
        cell.setupFirstMeasureLabel(Constants.firstMeasure[cellType])
        cell.setupSecondValueLabel(Constants.secondValue[cellType])
        cell.setupSecondMeasureLabel(Constants.secondMeasure[cellType])
        return cell
    }

    private func setupMainCell(_ cellType: Constants.CellType) -> MainCell {
        let identifier = Constants.getCellIdentifier(cellType)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! MainCell
        cell.setupTitleLabel(Constants.title[cellType])
        cell.setupSubtitleLabel(Constants.subtitle[cellType])
        return cell
    }
}

