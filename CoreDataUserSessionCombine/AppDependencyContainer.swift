//
//  AppDependencyContainer.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import Foundation

class AppDependencyContainer {
	
	// MARK: - Properties
	
	// Long-lived dependencies
	let sharedContentViewModel: ContentViewModel
	
	// MARK: - Methods
	
	init() {
		func makeTDMainViewModel() -> ContentViewModel {
			return ContentViewModel()
		}
		
		self.sharedContentViewModel = makeTDMainViewModel()
	}
	
	// Main
	// Factories needed to create a ContentView.
	
	func makeContentView() -> ContentView {
		let launchView = makeLaunchView()
		
		let onboardingViewFactory = {
			return self.makeOnboardingView()
		}
		
		let signedInViewFactory = {
			return self.makeSignedInView()
		}
		
		return ContentView(viewModel: self.sharedContentViewModel,
						   launchView: launchView,
						   makeOnboardingView: onboardingViewFactory,
						   makeSignedInView: signedInViewFactory)
	}
	
	// Launching
	
	func makeLaunchView() -> LaunchView {
		let launchViewModel = makeLaunchViewModel()
		return LaunchView(viewModel: launchViewModel)
	}
	
	func makeLaunchViewModel() -> LaunchViewModel {
		return LaunchViewModel(onboardingResponder: sharedContentViewModel,
							   signedInResponder: sharedContentViewModel)
	}
	
	// Onboarding
	
	func makeOnboardingView() -> OnboardingView {
		let onboardingViewModel = makeOnboardingViewModel()
		return OnboardingView(viewModel: onboardingViewModel)
	}
	
	func makeOnboardingViewModel() -> OnboardingViewModel {
		return OnboardingViewModel(signedInResponder: sharedContentViewModel)
	}

	
	// Signed In
	
	func makeSignedInView() -> SignedInView {
		let signedInViewModel = makeSignedInViewModel()
		return SignedInView(viewModel: signedInViewModel)
	}
	
	func makeSignedInViewModel() -> SignedInViewModel {
		return SignedInViewModel(onboardingResponder: sharedContentViewModel)
	}
}
