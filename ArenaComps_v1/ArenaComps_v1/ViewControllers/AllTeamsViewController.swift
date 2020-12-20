//
//  AllTeamsViewController.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class AllTeamsViewController: UIViewController {
	private let compManager: CompManager
	private var comps = [Comp]()
	private lazy var customView = AllTeams(comps: comps)
	
	init(compManager: CompManager) {
		self.compManager = compManager
		self.comps = compManager.getData()
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configurateView()
	}
	
	private func configurateView() {
		self.navigationItem.title = NavigationItems.allTeams
		self.view = customView
		customView.allTeamsDelegate = self
	}
}

extension AllTeamsViewController: IAllTeamsDelegate {
	func deleteTeam(_ row: Int) {
		self.compManager.deleteComp(row)
	}
}
