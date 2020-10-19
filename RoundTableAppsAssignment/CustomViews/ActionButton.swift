//
//  ActionButton.swift
//  RoundTableAppsAssignment
//
//  Created by Amirreza Eghtedari on 7/28/1399 AP.
//

import UIKit

class ActionButton: UIButton {
	
	override init(frame: CGRect) {
		
		super.init(frame: .zero)
		
		backgroundColor 	= .systemBlue
		setTitleColor(.white, for: .normal)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		
		super.layoutSubviews()
		
		layer.cornerRadius 	= 15
	}

}
