//
//  WeatherHoursCellModel.swift
//  TestProject
//
//  Created by Никита on 10.06.21.
//

import UIKit

class WeatherHoursCellModel: CellModel {
    
    private(set) var cellModels = [CellModel]()
    
    init() {
        super.init(cellIdentifier: WeatherHoursCell.cellIdentifier)
    }
    
    func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension WeatherHoursCellModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard cellModels.count > indexPath.item else { return .init() }
        
        // TODO: - Need to register cells here.
        collectionView.register(WeatherHoursCollectionCell.self, forCellWithReuseIdentifier: WeatherHoursCollectionCell.cellIdentifier)
        
        // FIXME: - Need change color
        let cellModel = cellModels[indexPath.item]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellModel.cellIdentifier,
            for: indexPath
        )
        if let fillableCell = cell as? FillableCell {
            fillableCell.fill(cellModel: cellModel)
        }
        return cell
    }
}
