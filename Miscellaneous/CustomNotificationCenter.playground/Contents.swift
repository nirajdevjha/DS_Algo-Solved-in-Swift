import Foundation

enum NotificationCenterError: Error {
    case notificationNotFound
}

final class MyNotificationCenter {
    static let shared = MyNotificationCenter()
    
    // Storing first string as a class name nested with notification name
    // Which is further nested with closure to execute when notification is posted
    private var notificationsStorage: [String: [String: [(String, Any) -> Void]]]

    private init() {
        notificationsStorage = [:]
    }

    func addObserver(_ _class: Any, name: String, closure: @escaping (String, Any) -> Void) {
        guard let inputClass = type(of: _class) as? AnyClass else {
            return
        }
        
        let className = String(describing: inputClass)
        if notificationsStorage[className] != nil && notificationsStorage[className]?[name] != nil {
            notificationsStorage[className]?[name]?.append(closure)
        } else {
            notificationsStorage[className] = [name: [closure]]
        }
    }

    func removeObserver(_ _class: Any) throws {
        
        guard let inputClass = type(of: _class) as? AnyClass else {
            return
        }
        
        let className = String(describing: inputClass)
        
        guard notificationsStorage[className] != nil else { throw NotificationCenterError.notificationNotFound }
        notificationsStorage.removeValue(forKey: className)
    }

    func postNotification(_ name: String, object: Any) throws {
        
        var atLeastOneNotificationFound = false
        for (_, notificationData) in notificationsStorage {
            for (notificationName, closures) in notificationData {
                guard notificationName == name else { continue }
                for closure in closures {
                    atLeastOneNotificationFound = true
                    closure(name, object)
                }
            }
        }
        
        if !atLeastOneNotificationFound {
            throw NotificationCenterError.notificationNotFound
        }
    }
}
