//
//  CountriesViewControllerInterface.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

protocol CountriesViewControllerInterface: UIViewController {
	
	var interactor: CountriesInteractorInterface { get }
	var delegate: CountriesViewControllerDelgate? { get set }
}
