import Foundation
import TBAData
import SwiftData

public typealias EventKey = String

extension TBAStore {

    public func event(key: EventKey) async throws -> Event? {
        async let model = api.event(key: key)
        async let existingEvent = Event.fetchEvent(key: key, in: modelContainer)
        do {
            return await Event.insert(try model, in: modelContainer)
        }
        catch {
            return try await existingEvent
        }
    }

    public func events(year: Int) async throws -> [Event] {
        async let models = api.events(year: year)
        async let existingEvents = Event.fetchEvents(year: year, in: modelContainer)
        do {
            return try await Event.insert(try models, in: modelContainer)
        }
        catch { (error)
            print("Error inserting - \(error)")
            return try await existingEvents
        }
    }

}
