//
//  MateCell.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class MateCell: UITableViewCell {
	private enum Metrics {
		static let numberOfLines = 0
		static let cornerRadius: CGFloat = 8
		
		static let imageSideSize: CGFloat = 50
		static let labelHeight: CGFloat = 80
		static let betweenItemsDimension: CGFloat = 20
	}
	
	private lazy var mateImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.layer.cornerRadius = Metrics.cornerRadius
		image.clipsToBounds = true
		
		return image
	}()
	
	private lazy var mateNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.configurateView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func setLibraryCell(cell: Mate) {
		self.mateImage.image = cell.getImage()
		self.mateNameLabel.text = cell.getName()
	}
}

private extension MateCell {
	func configurateView() {
		self.addSubview(mateImage)
		self.addSubview(mateNameLabel)
		
		NSLayoutConstraint.activate([
			self.mateImage.centerYAnchor.constraint(equalTo: centerYAnchor),
			self.mateImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.betweenItemsDimension),
			self.mateImage.heightAnchor.constraint(equalToConstant: Metrics.imageSideSize),
			self.mateImage.widthAnchor.constraint(equalTo: mateImage.heightAnchor),
			
			self.mateNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			self.mateNameLabel.leadingAnchor.constraint(equalTo: mateImage.trailingAnchor,
														constant: Metrics.betweenItemsDimension),
			self.mateNameLabel.heightAnchor.constraint(equalToConstant: Metrics.labelHeight),
			self.mateNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.betweenItemsDimension)
		])
	}
}
