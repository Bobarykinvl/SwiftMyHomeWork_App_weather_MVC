//
//  WeatherHoursCollectionCell.swift
//  TestProject
//
//  Created by Vladislav Bobarykin on 12.06.2021.
//

import UIKit

class WeatherHoursCollectionCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "WeatherHoursCollectionCell"
    
    weak var cellModel: WeatherHoursCollectionCellModel?
    
    // MARK: UI
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let degreeWeatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

// MARK: - Configure views

private extension WeatherHoursCollectionCell {
    
    func configureViews() {
        configureContainerStackView()
        configureTimeLabel()
        configureWeatherIconImageView()
        configureDegreeWeatherLabel()
    }
    
    func configureContainerStackView() {
        contentView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            containerStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0)
        ])
    }
    
    func configureTimeLabel() {
        contentView.addSubview(timeLabel)
        containerStackView.addArrangedSubview(timeLabel)
    }
    
    func configureWeatherIconImageView() {
        contentView.addSubview(weatherIconImageView)
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 32),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 32),
        ])
        containerStackView.addArrangedSubview(weatherIconImageView)
    }
    
    func configureDegreeWeatherLabel() {
        contentView.addSubview(degreeWeatherLabel)
        containerStackView.addArrangedSubview(degreeWeatherLabel)
    }
}

// MARK: - FillableCell

extension WeatherHoursCollectionCell: FillableCell {
    
    // Здесь мы связываем Cell с ее моделью, а также заполняем ячейку данными
    func fill(cellModel: CellModel) {
        guard let cellModel = cellModel as? WeatherHoursCollectionCellModel else { return }
        self.cellModel = cellModel
        timeLabel.text = cellModel.time
        weatherIconImageView.image = UIImage(named: cellModel.iconType.rawValue)
        degreeWeatherLabel.text = cellModel.degree
    }
}
