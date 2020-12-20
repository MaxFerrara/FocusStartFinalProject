//
//  MenuViewController.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class MenuViewController: UIViewController {
	private let customView = Menu()
	private let matesLibraryViewController = MatesLibraryViewController()
	private let list = MatesList()
	private var compManager = CompManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configurateCustomView()
	}
	
	private func configurateCustomView() {
		self.navigationItem.title = NavigationItems.menu
		self.view = customView
		customView.menuDelegate = self
	}
}

extension MenuViewController: IMenuDelegate {
	func openNewTeamScreen(_ sender: Any) {
		compManager.fetchData()
		let newTeamViewController = NewTeamViewController(matesList: list, compManager: compManager)
		navigationController?.pushViewController(newTeamViewController, animated: true)
	}
	
	func openAllTeamsScreen(_ sender: Any) {
		compManager.fetchData()
		let allTeamsViewController = AllTeamsViewController(compManager: compManager)
		navigationController?.pushViewController(allTeamsViewController, animated: true)
	}
	
	func openLibraryScreen(_ sender: Any) {
		navigationController?.pushViewController(matesLibraryViewController, animated: true)
	}
	
	func exitFromApplication(_ sender: Any) {
		exit(0)
	}
}
