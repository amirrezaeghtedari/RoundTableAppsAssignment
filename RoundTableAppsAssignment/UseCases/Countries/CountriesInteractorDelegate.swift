//
//  CountriesInteractorDelegate.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol CountriesInteractorDelegate {

	func interactor(_ interactor: CountriesInteractorInterface, didFetch result: Result<[Country], Error>)
	func interactor(_ interactor: CountriesInteractorInterface, didUpdate countries: [Country])
}
