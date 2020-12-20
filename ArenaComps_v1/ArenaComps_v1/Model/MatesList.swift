//
//  MatesList.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import UIKit

struct MatesList {
	private let druid = Mate(Image.druid!,Role.healer, Name.druid.rawValue, Description.druid)
	private let hunter = Mate(Image.hunter!, Role.rangeDamageDealer, Name.hunter.rawValue, Description.hunter)
	private let mage = Mate(Image.mage!, Role.rangeDamageDealer, Name.mage.rawValue, Description.mage)
	private let paladin = Mate(Image.paladin!, Role.healer, Name.paladin.rawValue, Description.paladin)
	private let priest = Mate(Image.priest!, Role.healer, Name.priest.rawValue, Description.priest)
	private let rogue = Mate(Image.rogue!, Role.meleeDamageDealer, Name.rogue.rawValue, Description.rogue)
	private let shaman = Mate(Image.shaman!, Role.rangeDamageDealer, Name.shaman.rawValue, Description.shaman)
	private let warlock = Mate(Image.warlock!, Role.rangeDamageDealer, Name.warlock.rawValue, Description.warlock)
	private let warrior = Mate(Image.warrior!, Role.meleeDamageDealer, Name.warrior.rawValue, Description.warrior)
	
	func getAll() -> [Mate] {
		return [druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior]
	}
}
