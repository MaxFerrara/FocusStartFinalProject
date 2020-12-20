//
//  CompManager.swift
//  ArenaComps_v1
//
//  Created by Max on 20.12.2020.
//

import Foundation
import UIKit
import CoreData

class CompManager {
	var comps = [Comp]()
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	func getData() -> [Comp]{
		return self.comps
	}
	
	func getDataLength() -> Int {
		return self.comps.count
	}
	
	func fetchData() {
		do {
			self.comps = try context.fetch(Comp.fetchRequest())
		} catch {
			print("fetch data problem")
		}
	}
	
	func addComp(_ team: Team) {
		let newComp = Comp(context: self.context)
		
		newComp.name = team.getName()
		newComp.firstMate = team.getfirstMateName()
		newComp.secondMate = team.getSecondMateName()
		newComp.thirdMate = team.getThirdMateName()
		newComp.rating = Int16(team.getRating())
		
		do {
			try self.context.save()
		} catch {
			print("save comp problem")
		}
	}
	
	func deleteComp(_ index: Int) {
		let compToRemove = self.comps[index]
		self.context.delete(compToRemove)
		
		do {
			try self.context.save()
		} catch {
			print("save comp problem")
		}
	}
}
