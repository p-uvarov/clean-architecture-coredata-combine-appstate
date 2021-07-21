//
//  UserSession.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import Combine

class UserSession {
	static let shared: UserSession = {
		let instance = UserSession()
		if let userData = CoreDataManager.shared.fetchUserData() {
			let user = User(firstName: userData.firstName ?? "",
							lastName: userData.lastName ?? "")
			instance.user = user
		}
		instance.subscribe()
		
		return instance
	}()
	
	@Published var user: User?
	
	var subscriptions = Set<AnyCancellable>()
	
	func subscribe() {
		$user
			.sink(receiveValue: CoreDataManager.shared.onUserUpdate)
			.store(in: &subscriptions)
	}
}

class User {
	@Published var firstName = ""
	@Published var lastName = ""
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}
