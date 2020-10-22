//
//  CountryViewModel.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/28/1399 AP.
//

import Foundation

struct CountryViewModel: Hashable {
	
	let name: String
	var actionLabelTitle: String
	var actionLabelColor: CountrySelectButtonColor
}


extension CountryViewModel: Equatable {
	
	static func == (lhs: CountryViewModel, rhs: CountryViewModel) -> Bool {
		
		return lhs.name == rhs.name
	}
}

