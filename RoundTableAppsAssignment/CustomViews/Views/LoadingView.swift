//
//  LoadingView.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 8/2/1399 AP.
//

import UIKit

class LoadingView: UIView {
	
	init() {
		
		super.init(frame: .zero)
		
		configLoading()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func configLoading() {
		
		backgroundColor 	= UIColor.secondarySystemBackground
		alpha 				= 1
		
		let activityIndicator = UIActivityIndicatorView(style: .large)
		activityIndicator.startAnimating()
		addSubview(activityIndicator)
		
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])
	}
}
