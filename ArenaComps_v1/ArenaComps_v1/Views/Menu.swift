//
//  Menu.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import Foundation
import UIKit

protocol IMenuDelegate: class {
	func openNewTeamScreen(_ sender: Any)
	func openAllTeamsScreen(_ sender: Any)
	func openLibraryScreen(_ sender: Any)
	func exitFromApplication(_ sender: Any)
}

enum NavigationItems {
	static let menu = "Menu"
	static let newTeam = "New Team"
	static let allTeams = "All teams"
	static let matesLibrary = "Mates library"
	static let exit = "Exit"
}

class Menu: UIView {
	private enum Metrics {
		static let numberOfLines = 1
		static let textLabelSize: CGFloat = 25
		static let labelIndetion: CGFloat = 30
	}
	
	weak var menuDelegate: IMenuDelegate?
	
	private lazy var newTeamLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		label.text = NavigationItems.newTeam
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: Metrics.textLabelSize)
		label.textColor = .black
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(onNewTeamLabelClick(_:)))
		label.isUserInteractionEnabled = true
		label.addGestureRecognizer(tap)
		
		return label
	}()
	
	private lazy var teamsListLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		label.text = NavigationItems.allTeams
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: Metrics.textLabelSize)
		label.textColor = .black
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(onTeamsListLabelClick(_:)))
		label.isUserInteractionEnabled = true
		label.addGestureRecognizer(tap)
		
		return label
	}()
	
	private lazy var classesLibraryLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		label.text = NavigationItems.matesLibrary
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: Metrics.textLabelSize)
		label.textColor = .black
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(onClassesLibraryLabelClick(_:)))
		label.isUserInteractionEnabled = true
		label.addGestureRecognizer(tap)
		
		return label
	}()
	
	private lazy var exitLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = Metrics.numberOfLines
		label.text = NavigationItems.exit
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: Metrics.textLabelSize)
		label.textColor = .black
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(onExitLabelClick(_:)))
		label.isUserInteractionEnabled = true
		label.addGestureRecognizer(tap)
		
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		self.configurateView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension Menu {
	func configurateView() {
		let guide = self.safeAreaLayoutGuide
		self.backgroundColor = .white
		self.addSubview(newTeamLabel)
		self.addSubview(teamsListLabel)
		self.addSubview(classesLibraryLabel)
		self.addSubview(exitLabel)
		
		NSLayoutConstraint.activate([
			self.newTeamLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: Metrics.labelIndetion),
			self.newTeamLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.teamsListLabel.topAnchor.constraint(equalTo: newTeamLabel.bottomAnchor, constant: Metrics.labelIndetion),
			self.teamsListLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.classesLibraryLabel.topAnchor.constraint(equalTo: teamsListLabel.bottomAnchor, constant: Metrics.labelIndetion),
			self.classesLibraryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			
			self.exitLabel.topAnchor.constraint(equalTo: classesLibraryLabel.bottomAnchor, constant: Metrics.labelIndetion),
			self.exitLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
		])
	}
}

extension Menu {
	@objc func onNewTeamLabelClick(_ sender: Any) {
		menuDelegate?.openNewTeamScreen(sender)
	}
	
	@objc func onTeamsListLabelClick(_ sender: Any) {
		menuDelegate?.openAllTeamsScreen(sender)
	}
	
	@objc func onClassesLibraryLabelClick(_ sender: Any) {
		menuDelegate?.openLibraryScreen(sender)
	}
	
	@objc func onExitLabelClick(_ sender: Any) {
		menuDelegate?.exitFromApplication(sender)
	}
}
