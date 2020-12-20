//
//  AllTeams.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import Foundation
import UIKit

protocol IAllTeamsDelegate: class {
	func deleteTeam(_ row: Int)
}

class AllTeams: UIView {
	private let cellName = "TeamCell"
	private var comps: [Comp]
	public weak var allTeamsDelegate: IAllTeamsDelegate?
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.rowHeight = 100
		tableView.backgroundColor = .white
		
		return tableView
	}()
	
	init(comps: [Comp]) {
		self.comps = comps
		super.init(frame: .zero)
		self.configurateView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension AllTeams {
	func configurateView() {
		let safeAreaGuide = self.safeAreaLayoutGuide
		
		self.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		self.backgroundColor = .white
		self.tableView.register(TeamCell.self, forCellReuseIdentifier: self.cellName)
		
		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
		])
	}
}

extension AllTeams: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return comps.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName) as! TeamCell
		let cellInner = comps[indexPath.row]
		cell.setTeamCell(cellInner)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		guard editingStyle == .delete else {return}
		
		comps.remove(at: indexPath.row)
		allTeamsDelegate?.deleteTeam(indexPath.row)
		
		tableView.deleteRows(at: [indexPath], with: .automatic)
	}
}
