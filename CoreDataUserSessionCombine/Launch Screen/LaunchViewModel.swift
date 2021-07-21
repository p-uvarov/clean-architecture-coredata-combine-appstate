//
//  LaunchViewModel.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import Foundation

class LaunchViewModel: ObservableObject {
	// MARK: - Properties
	let onboardingResponder: OnboardingResponder
	let signedInResponder: SignedInResponder
	
	// MARK: - Methods
	init(onboardingResponder: OnboardingResponder,
		 signedInResponder: SignedInResponder) {
		self.onboardingResponder = onboardingResponder
		self.signedInResponder = signedInResponder
	}
	
	func onAppear() {
		if let user = UserSession.shared.user {
			signedInResponder.setSignedInRoute(with: user)
		} else {
			onboardingResponder.setOnboardingRoute()
		}
	}
}
