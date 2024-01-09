import Foundation
import TBAData
import SwiftData

public typealias EventKey = String

extension TBAStore {

    public func event(key: EventKey) async throws -> Event? {
        async let model = api.event(key: key)
        async let existingEvent = modelContainer.fetchEvent(key: key)
        do {
            let event = Event(try await model)
            await modelContainer.insert(event: event)
            // TODO: Save?
            return event
        }
        catch {
            print("Error inserting event - \(error)")
            return try await existingEvent
        }
    }

    public func events(year: Int) async throws -> [Event] {
        async let models = api.events(year: year)
        async let existingEvents = modelContainer.fetchEvents(year: year)
        do {
            let events = try await models.map { Event($0) }
            await modelContainer.insert(events: events)
            // TODO: Save
            return events
        }
        catch {
            print("Error inserting events - \(error)")
            return try await existingEvents
        }
    }

}
