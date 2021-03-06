//
//  CountriesViewControllerDelegate.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import Foundation

protocol CountriesViewControllerDelgate: class {
	
	func viewController(_: CountriesViewController, didSelect countries: [Country])
}
