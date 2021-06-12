//
//  GeneralWeatherTableCell.swift
//  TestProject
//
//  Created by Vladislav Bobarykin on 12.06.2021.
//

import UIKit

class GeneralWeatherTableCell: UITableViewCell {
    
    static let cellIdentifier: String = "GeneralWeatherTableCell"
    
    weak var cellModel: GeneralWeatherTableCellModel?
    
    // MARK: UI
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    let textWeatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let degreeWeatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 54)
        return label
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

private extension GeneralWeatherTableCell {
    
    func configureViews() {
        selectionStyle = .none
        configureContainerStackView()
        configureCityLabel()
        configureTextWeatherLabel()
        configureDegreeWeatherLabel()
    }
    
    func configureContainerStackView() {
        contentView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -80),
            containerStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            containerStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
    
    func configureCityLabel() {
        contentView.addSubview(cityLabel)
        containerStackView.addArrangedSubview(cityLabel)
    }
    
    func configureTextWeatherLabel() {
        contentView.addSubview(textWeatherLabel)
        containerStackView.addArrangedSubview(textWeatherLabel)
    }
    
    func configureDegreeWeatherLabel() {
        contentView.addSubview(degreeWeatherLabel)
        containerStackView.addArrangedSubview(degreeWeatherLabel)
    }
}

// MARK: - FillableCell

extension GeneralWeatherTableCell: FillableCell {
    
    // Здесь мы связываем Cell с ее моделью, а также заполняем ячейку данными
    func fill(cellModel: CellModel) {
        guard let cellModel = cellModel as? GeneralWeatherTableCellModel else { return }
        self.cellModel = cellModel
        cityLabel.text = cellModel.cityName
        textWeatherLabel.text = cellModel.textWeather
        degreeWeatherLabel.text = cellModel.degreeWeatherString
    }
}

