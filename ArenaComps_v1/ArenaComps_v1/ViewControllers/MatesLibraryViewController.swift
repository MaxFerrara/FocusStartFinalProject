//
//  MatesLibraryViewController.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class MatesLibraryViewController: UIViewController {
	private let list = MatesList()
	private lazy var customView = MatesLibrary(matesList: list.getAll())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configurateView()
	}
	
	private func configurateView() {
		self.navigationItem.title = NavigationItems.matesLibrary
		self.view = customView
		customView.matesLibraryDelegate = self
	}
}

extension MatesLibraryViewController: IMatesLibraryDelegate {
	func delegateTableCellClick(mate: Mate) {
		let destination = MateDescriptionViewController()
		destination.setCellDescription(mate: mate)
		navigationController?.pushViewController(destination, animated: true)
	}
}
