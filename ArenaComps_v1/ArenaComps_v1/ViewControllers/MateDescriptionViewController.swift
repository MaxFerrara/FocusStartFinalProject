//
//  MateDescriptionViewController.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class MateDescriptionViewController: UIViewController {
	private enum Metrics {
		static let numberOfLines = 0
		static let textSize: CGFloat = 25
		static let cornerRadius: CGFloat = 10
		
		static let leadingLabelConstraint: CGFloat = 50
		static let textViewConstraint: CGFloat = 16
	}
	
	private lazy var teamRoleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		label.font = .systemFont(ofSize: Metrics.textSize)
		
		return label
	}()
	
	private lazy var mateDescriptionTextView: UITextView = {
		let textView = UITextView()
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.layer.cornerRadius = Metrics.cornerRadius
		textView.backgroundColor = .systemTeal
		textView.textAlignment = .justified
		textView.font = .systemFont(ofSize: Metrics.textSize)
		
		return textView
	}()
	
	public func setCellDescription(mate: Mate) {
		self.navigationItem.title = mate.getName()
		self.teamRoleLabel.text = mate.getRole().rawValue
		self.mateDescriptionTextView.text = mate.getDescription()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configurateView()
	}
}

private extension MateDescriptionViewController {
	func configurateView() {
		let safeArea = self.view.safeAreaLayoutGuide
		
		self.view.backgroundColor = .white
		self.view.addSubview(teamRoleLabel)
		self.view.addSubview(mateDescriptionTextView)
		
		NSLayoutConstraint.activate([
			self.teamRoleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
			self.teamRoleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.leadingLabelConstraint),
			
			self.mateDescriptionTextView.topAnchor.constraint(
				equalTo: teamRoleLabel.bottomAnchor,
				constant: Metrics.textViewConstraint),
			self.mateDescriptionTextView.leadingAnchor.constraint(
				equalTo: safeArea.leadingAnchor,
				constant: Metrics.textViewConstraint),
			self.mateDescriptionTextView.trailingAnchor.constraint(
				equalTo: safeArea.trailingAnchor,
				constant: -Metrics.textViewConstraint),
			self.mateDescriptionTextView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
		])
	}
}
