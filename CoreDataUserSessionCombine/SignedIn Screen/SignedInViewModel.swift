//
//  SignedInViewModel.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import Foundation

class SignedInViewModel: ObservableObject {
	// MARK: - Properties
	let onboardingResponder: OnboardingResponder
	
	// MARK: - Methods
	init(onboardingResponder: OnboardingResponder) {
		self.onboardingResponder = onboardingResponder
	}
	
	func signOut() {
		onboardingResponder.setOnboardingRoute()
	}
}
