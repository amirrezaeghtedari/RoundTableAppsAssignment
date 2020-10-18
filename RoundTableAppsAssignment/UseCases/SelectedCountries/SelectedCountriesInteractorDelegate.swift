//
//  SelectedCountriesInteractorDelegate.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol SelectedCountriesInteractorDelegate {
	
	func interactor(_: SelectedCountriesInteractor, didSelectCountries countries: [Country])
}
