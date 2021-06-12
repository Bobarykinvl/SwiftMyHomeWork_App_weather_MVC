//
//  WeatherHoursCell.swift
//  TestProject
//
//  Created by Никита on 10.06.21.
//

import UIKit

class WeatherHoursCell: UITableViewCell {
    
    static let cellIdentifier = "WeatherHoursCell"
    
    weak var cellModel: WeatherHoursCellModel?
    
    // MARK: UI
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    // MARK: Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

// MARK: - Configure views

private extension WeatherHoursCell {
    
    func configureViews() {
        selectionStyle = .none
        configureContainerStackView()
    }
    
    func configureContainerStackView() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.CollectionView.height)
        ])
    }
}

// MARK: - Constants

private extension WeatherHoursCell {
    
    enum Constants {
        enum CollectionView {
            static let height: CGFloat = 120
        }
    }
}

// MARK: - FillableCell

extension WeatherHoursCell: FillableCell {
    
    // Здесь мы связываем Cell с ее моделью, а также заполняем ячейку данными
    func fill(cellModel: CellModel) {
        guard let cellModel = cellModel as? WeatherHoursCellModel else { return }
        self.cellModel = cellModel
        cellModel.setupCollectionView(collectionView)
    }
}
