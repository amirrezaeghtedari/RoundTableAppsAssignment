//
//  CountriesPresenterDelegate.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol CountriesPresenterDelegate: class {
	
	func presenter(_ presenter: CountriesPresenterInterface, didFetch result: Result<[CountryViewModel], CountriesError>)
	func presenter(_ presenter: CountriesPresenterInterface, didUpdate countries: [CountryViewModel])
}
