//
//  LoadingViewProviderInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

protocol LoadingViewProviderInterfaces {
	
	func showLoading(on view: UIView)
	
	func dismissLoading()
}
