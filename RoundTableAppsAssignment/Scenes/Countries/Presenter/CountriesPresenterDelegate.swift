//
//  CountriesPresenterDelegate.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol CountriesPresenterDelegate: class {
	
	func presenter(_: CountriesPresenterInterface, didUpdate result: Result<[CountryViewModel], Error>)
}
