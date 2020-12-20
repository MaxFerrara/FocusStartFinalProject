//
//  TeamCell.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class TeamCell: UITableViewCell {
	private enum Metrics {
		static let numberOfLines = 0
		static let cornerRadius: CGFloat = 8
		static let textLabelSize: CGFloat = 20
		
		static let buttonTitle = "delete"
		static let ratingLabelText = "rating:"
	}
	
	private var matesList = MatesList().getAll()
	
	private lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		
		return label
	}()
	
	private lazy var firstMateImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.layer.cornerRadius = Metrics.cornerRadius
		image.clipsToBounds = true
		
		return image
	}()
	
	private lazy var secondMateImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.layer.cornerRadius = Metrics.cornerRadius
		image.clipsToBounds = true
		
		return image
	}()
	
	private lazy var thirdMateImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.layer.cornerRadius = Metrics.cornerRadius
		image.clipsToBounds = true
		
		return image
	}()
	
	private lazy var ratingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		label.font = UIFont.systemFont(ofSize: Metrics.textLabelSize)
		
		return label
	}()
	
	private lazy var scoreLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		label.text = Metrics.ratingLabelText
		
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.configurateView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setTeamCell(_ comp: Comp) {
		self.nameLabel.text = comp.name
		self.firstMateImage.image = getImageByClassName(comp.firstMate)
		self.secondMateImage.image = getImageByClassName(comp.secondMate)
		self.thirdMateImage.image = getImageByClassName(comp.thirdMate)
		self.ratingLabel.text = String(comp.rating)
	}
}

private extension TeamCell {
	func getImageByClassName(_ name: String) -> UIImage {
		var image: UIImage?
		
		for mate in matesList {
			if name == mate.getName() {
				image = mate.getImage()
			}
		}
		
		return image!
	}
	
	func configurateView() {
		self.addSubview(firstMateImage)
		self.addSubview(secondMateImage)
		self.addSubview(thirdMateImage)
		self.addSubview(nameLabel)
		self.addSubview(ratingLabel)
		self.addSubview(scoreLabel)
		self.backgroundColor = .systemTeal
		
		NSLayoutConstraint.activate([
			self.firstMateImage.topAnchor.constraint(equalTo: topAnchor, constant: 6),
			self.firstMateImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
			self.firstMateImage.widthAnchor.constraint(equalToConstant: 50),
			self.firstMateImage.heightAnchor.constraint(equalTo: firstMateImage.widthAnchor),
			
			self.secondMateImage.topAnchor.constraint(equalTo: topAnchor, constant: 6),
			self.secondMateImage.leadingAnchor.constraint(equalTo: firstMateImage.trailingAnchor, constant: 10),
			self.secondMateImage.widthAnchor.constraint(equalTo: firstMateImage.widthAnchor),
			self.secondMateImage.heightAnchor.constraint(equalTo: firstMateImage.widthAnchor),
			
			self.thirdMateImage.topAnchor.constraint(equalTo: topAnchor, constant: 6),
			self.thirdMateImage.leadingAnchor.constraint(equalTo: secondMateImage.trailingAnchor, constant: 10),
			self.thirdMateImage.widthAnchor.constraint(equalTo: firstMateImage.widthAnchor),
			self.thirdMateImage.heightAnchor.constraint(equalTo: firstMateImage.widthAnchor),
			
			self.nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
			self.nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
			
			self.ratingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22),
			self.ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
			
			self.scoreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
			self.scoreLabel.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor, constant: -4)
		])
	}
}
