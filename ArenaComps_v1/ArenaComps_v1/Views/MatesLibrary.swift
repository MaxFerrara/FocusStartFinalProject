//
//  MatesLibrary.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import Foundation
import UIKit

protocol IMatesLibraryDelegate: class {
	func delegateTableCellClick(mate: Mate)
}

class MatesLibrary: UIView {
	private let cellName = "MateCell"
	private let matesList: [Mate]
	public weak var matesLibraryDelegate: IMatesLibraryDelegate?
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.rowHeight = 100
		tableView.backgroundColor = .cyan
		
		return tableView
	}()
	
	init(matesList: [Mate]) {
		self.matesList = matesList
		super.init(frame: .zero)
		self.configurateView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension MatesLibrary {
	func configurateView() {
		let safeAreaGuide = self.safeAreaLayoutGuide
		
		self.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		self.backgroundColor = .white
		self.tableView.register(MateCell.self, forCellReuseIdentifier: self.cellName)
		
		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
		])
	}
}

extension MatesLibrary: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return matesList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName) as! MateCell
		let cellInner = matesList[indexPath.row]
		cell.setLibraryCell(cell: cellInner)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let currentMate = matesList[indexPath.row]
		matesLibraryDelegate?.delegateTableCellClick(mate: currentMate)
	}
}
