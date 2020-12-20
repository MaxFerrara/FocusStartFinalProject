//
//  NewTeamViewController.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class NewTeamViewController: UIViewController {
	private enum TextFieldHint: String {
		case valid = "enter team name"
		case notValid = "text field is empty"
	}
	
	private var matesList: [Mate]
	private lazy var customView = NewTeam(mates: matesList)
	private var compManager: CompManager
	
	init(matesList: MatesList, compManager: CompManager) {
		self.compManager = compManager
		self.matesList = matesList.getAll()
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configurateCustomView() {
		self.navigationItem.title = NavigationItems.newTeam
		self.view = customView
		customView.newTeamDelegate = self
		customView.setTeamNameTextFieldHint(hint: TextFieldHint.valid.rawValue)
	}
	
	private func transformTeamData(_ name: String, _ mates: [String]) -> Team {
		return Team(name, mates[0], mates[1], mates[2], 0)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configurateCustomView()
		self.dismissKey()
	}
}

extension NewTeamViewController: INewTeamDelegate {
	func addTeam(_ sender: UIButton!) {
		if customView.isTeamNameTextFieldEmpty() {
			self.customView.setTeamNameTextFieldHint(hint: TextFieldHint.notValid.rawValue)
		} else {
			let newteam = transformTeamData(customView.getTeamName(), customView.getPickerValues())
			let analyst = ArenaTeamAnalyst(list: matesList)
			
			analyst.calculateRating(newteam)
			compManager.addComp(newteam)
			customView.clearTextField()
		}
	}
}

extension UIViewController {
	func dismissKey() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(
			target: self,
			action: #selector(UIViewController.dismissKeyboard))
		
		tap.cancelsTouchesInView = false;
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}
