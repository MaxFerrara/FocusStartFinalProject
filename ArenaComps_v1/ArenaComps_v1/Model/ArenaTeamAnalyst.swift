//
//  ArenaTeamAnalyst.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import Foundation

class ArenaTeamAnalyst {
	private let teamRole = ["meleeDamageDealer", "rangeDamageDealer", "healer"]
	private let list: [Mate]
	
	init(list: [Mate]) {
		self.list = list
	}
	
	func calculateRating(_ team: Team) {
		var healCount = 0
		var meleeDamagerCount = 0
		var rangeDamagerCount = 0
		
		let transformedTeam = trasformTeam(team)
		
		for mate in transformedTeam {
			if mate.getRole().rawValue == teamRole[0] {
				meleeDamagerCount += 1
			}
			
			if mate.getRole().rawValue == teamRole[1] {
				rangeDamagerCount += 1
			}
			
			if mate.getRole().rawValue == teamRole[2] {
				healCount += 1
			}
		}
		
		var finalRating = 0
		
		if (healCount == 1 && meleeDamagerCount == 1 && rangeDamagerCount == 1) || (healCount == 1 && rangeDamagerCount == 2) {
			finalRating = 5
		} else if healCount == 1 && meleeDamagerCount == 2 {
			finalRating = 4
		} else if healCount == 2 && meleeDamagerCount == 1 {
			finalRating = 3
		} else if rangeDamagerCount == 3 {
			finalRating = 2
		} else {
			finalRating = 1
		}
		
		team.setRating(finalRating)
	}
	
	private func trasformTeam(_ team: Team) -> [Mate] {
		let names = [team.getfirstMateName(), team.getSecondMateName(), team.getThirdMateName()]
		var mates = [Mate]()
		
		for name in names {
			for item in list {
				if name == item.getName() {
					mates.append(item)
				}
			}
		}
		
		return mates
	}
}
