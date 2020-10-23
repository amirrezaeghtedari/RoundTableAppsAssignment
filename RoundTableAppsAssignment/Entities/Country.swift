//
//  Country.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

class Country {
	
	let name: String
	var isSelected: Bool
	
	init(name: String, isSelected: Bool) {
		
		self.name	 	= name
		self.isSelected = isSelected
	}
}

extension Country: Equatable {
	
	static func == (lhs: Country, rhs: Country) -> Bool {
		
		return lhs.name == rhs.name
	}

}
