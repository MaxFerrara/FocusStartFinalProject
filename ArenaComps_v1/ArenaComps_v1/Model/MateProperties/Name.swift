//
//  Name.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

enum Name: String {
	case druid
	case hunter
	case mage
	case paladin
	case priest
	case rogue
	case shaman
	case warlock
	case warrior
	
	var name: String {
		return String(describing: self)
	}
}
