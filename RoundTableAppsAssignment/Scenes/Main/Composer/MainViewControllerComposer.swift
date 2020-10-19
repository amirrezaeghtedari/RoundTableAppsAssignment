//
//  MainComposer.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/27/1399 AP.
//

import UIKit

class MainViewControllerComposer {
	
	func makeModule() -> MainViewController {
		
		let interactor 			= SelectedCountriesInteractor()
		let presenter			= MainPresenter()
		
		let mainViewController 	= MainViewController(interactor: interactor)
		interactor.delegate 	= presenter
		presenter.delegate		= mainViewController
		
		return mainViewController
	}
}
