//
//  CountriesInteractorDelegate.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol CountriesInteractorDelegate {

	func interactor(_: CountriesInteractorInterface, didUpdate result: Result<[Country], Error>)
}
