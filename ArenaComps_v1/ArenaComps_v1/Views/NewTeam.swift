//
//  NewTeam.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import Foundation
import UIKit

protocol INewTeamDelegate: class {
	func addTeam(_ sender: UIButton!)
}

class NewTeam: UIView {
	private enum Metrics {
		static let buttonTitle = "add"
		static let cornerRadius: CGFloat = 6
		static let borderWidth: CGFloat = 2
		
		static let textFieldHeight: CGFloat = 50
		static let pickerHeight: CGFloat = 150
		
		static let matesQuantity = 3
	}
	
	public weak var newTeamDelegate: INewTeamDelegate?
	private var matesNames = [String]()
	
	private lazy var teamNameTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.layer.cornerRadius = Metrics.cornerRadius
		textField.borderStyle = .line
		
		return textField
	}()
	
	private lazy var matesPicker: UIPickerView = {
		let picker = UIPickerView()
		picker.translatesAutoresizingMaskIntoConstraints = false
		picker.backgroundColor = .white
		
		return picker
	}()
	
	private lazy var addTeamButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle(Metrics.buttonTitle, for: .normal)
		button.backgroundColor = .systemTeal
		button.tintColor = .black
		button.layer.borderWidth = Metrics.borderWidth
		button.layer.cornerRadius = Metrics.cornerRadius
		button.addTarget(self, action: #selector(onAddButtonClick(_:)), for: .touchUpInside)
		
		return button
	}()
	
	
	init(mates: [Mate]) {
		super.init(frame: .zero)
		for mate in mates {
			self.matesNames.append(mate.getName())
		}
		
		self.configurateView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func getPickerValues() -> [String] {
		var names = [String]()
		names.append(matesNames[matesPicker.selectedRow(inComponent: 0)])
		names.append(matesNames[matesPicker.selectedRow(inComponent: 1)])
		names.append(matesNames[matesPicker.selectedRow(inComponent: 2)])
		
		return names
	}
	
	func clearTextField() {
		teamNameTextField.text = ""
	}
	
	func getTeamName() -> String {
		return teamNameTextField.text!
	}
	
	func setTeamNameTextFieldHint(hint: String) {
		self.teamNameTextField.placeholder = hint
	}
	
	func isTeamNameTextFieldEmpty() -> Bool {
		guard let text = teamNameTextField.text, !text.isEmpty else {
			return true
		}
		
		return false
	}
}

private extension NewTeam {
	func configurateView() {
		let safeArea = self.safeAreaLayoutGuide
		self.addSubview(teamNameTextField)
		self.addSubview(matesPicker)
		self.addSubview(addTeamButton)
		self.backgroundColor = .white
		
		matesPicker.delegate = self
		matesPicker.dataSource = self
		
		NSLayoutConstraint.activate([
			self.teamNameTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
			self.teamNameTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15),
			self.teamNameTextField.trailingAnchor.constraint(equalTo: addTeamButton.leadingAnchor, constant: -15),
			self.teamNameTextField.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight),
			
			self.addTeamButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
			self.addTeamButton.leadingAnchor.constraint(equalTo: teamNameTextField.trailingAnchor, constant: 10),
			self.addTeamButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
			self.addTeamButton.heightAnchor.constraint(equalTo: teamNameTextField.heightAnchor),
			self.addTeamButton.widthAnchor.constraint(equalToConstant: 46),
			
			self.matesPicker.topAnchor.constraint(equalTo: teamNameTextField.bottomAnchor, constant: 25),
			self.matesPicker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.matesPicker.heightAnchor.constraint(equalToConstant: Metrics.pickerHeight),
			self.matesPicker.widthAnchor.constraint(equalTo: self.widthAnchor)
		])
	}
	
	@objc func onAddButtonClick(_ sender: UIButton!) {
		newTeamDelegate?.addTeam(sender)
	}
}

extension NewTeam: UIPickerViewDataSource, UIPickerViewDelegate {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return Metrics.matesQuantity
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return matesNames.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return matesNames[row]
	}
}
