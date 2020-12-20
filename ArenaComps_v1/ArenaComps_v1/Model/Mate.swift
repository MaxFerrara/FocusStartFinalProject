//
//  Mate.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

class Mate {
	private let image: UIImage
	private var role: Role
	private var name: String
	private var description: String
	
	init(_ image: UIImage, _ role: Role, _ name: String, _ description: String) {
		self.image = image
		self.role = role
		self.name = name
		self.description = description
	}
	
	func getImage() -> UIImage {
		return self.image
	}
	
	func getName() -> String {
		return self.name
	}
	
	func getDescription() -> String {
		return self.description
	}
	
	func getRole() -> Role {
		return self.role
	}
}
