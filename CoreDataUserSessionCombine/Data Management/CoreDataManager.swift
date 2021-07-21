//
//  CoreDataManager.swift
//  CoreDataUserSessionCombine
//
//  Created by Pavel Uvarov on 2021-07-20.
//

import CoreData

// Get the managed object context from the shared persistent container.
public let context = CoreDataManager.shared.persistentContainer.viewContext

class CoreDataManager {
	static let shared: CoreDataManager = {
		let instance = CoreDataManager()
		return instance
	}()
		
	// MARK: - Core Data stack
	
	lazy var persistentContainer: NSPersistentCloudKitContainer = {
		/*
		 The persistent container for the application. This implementation
		 creates and returns a container, having loaded the store for the
		 application to it. This property is optional since there are legitimate
		 error conditions that could cause the creation of the store to fail.
		*/
		let container = NSPersistentCloudKitContainer(name: "CoreDataUserSessionCombine")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				 
				/*
				 Typical reasons for an error here include:
				 * The parent directory does not exist, cannot be created, or disallows writing.
				 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
				 * The device is out of space.
				 * The store could not be migrated to the current model version.
				 Check the error message to determine what the actual problem was.
				 */
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()

	// MARK: - Core Data Saving support

	func saveContext () {
		let context = persistentContainer.viewContext
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
	
	func fetchUserData() -> UserData? {
		let request: NSFetchRequest<UserData> = UserData.fetchRequest()
		
		do {
			if let userData = try context.fetch(request).first {
				print(try context.fetch(request))
				return userData
			}
		} catch {
			print("Error fetching user data from context \(error.localizedDescription)")
			return nil
		}
		
		return nil
	}
	
	func onUserUpdate(_ user: User?) {
		let userData: UserData = fetchUserData() ?? UserData(context: context)
		if let user = user {
			userData.firstName = user.firstName
			userData.lastName = user.lastName
		} else {
			context.delete(userData)
		}
		saveContext()
	}
}
