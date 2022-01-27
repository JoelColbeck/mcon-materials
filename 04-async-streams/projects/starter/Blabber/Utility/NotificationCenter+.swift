import Foundation

extension NotificationCenter {
  func notifications(
    for name: Notification.Name
  ) async throws -> AsyncStream<Notification> {
    AsyncStream { continuation in
      addObserver(forName: name, object: nil, queue: nil) { notification in
        continuation.yield(notification)
      }
    }
  }
}
