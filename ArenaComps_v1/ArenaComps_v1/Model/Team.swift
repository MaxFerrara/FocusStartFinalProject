//
//  Team.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import Foundation
import UIKit

class Team {
	private var teamName: String
	private var firstMate: String
	private var secondMate: String
	private var thirdMate: String
	private var rating: Int
	
	init(_ teamName: String, _ firstMate: String, _ secondMate: String, _ thirdMate: String, _ rating: Int) {
		self.teamName = teamName
		self.firstMate = firstMate
		self.secondMate = secondMate
		self.thirdMate = thirdMate
		self.rating = rating
	}
	
	func getName() -> String {
		return self.teamName
	}
	
	func getfirstMateName() -> String {
		return self.firstMate
	}
	
	func getSecondMateName() -> String {
		return self.secondMate
	}
	
	func getThirdMateName() -> String {
		return self.thirdMate
	}
	
	func setRating(_ rating: Int) {
		self.rating = rating
	}
	
	func getRating() -> Int {
		return self.rating
	}
}
