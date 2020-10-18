//
//  MainPresenterDelegate.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol MainPresenterDelegate: class {
	
	func presenter(_: MainPresenter, didSelectCountries countries: [MainCountryViewModel])
}
