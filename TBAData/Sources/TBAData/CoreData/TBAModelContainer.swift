//
//  TBAModelContainer.swift
//
//
//  Created by Zachary Orr on 1/8/24.
//

import Foundation
import SwiftData

public actor TBAModelContainer: ModelActor {

    private static let SchemaVersion: Schema.Version = Schema.Version(1, 0, 0)
    private static let AppGroupIdentifier = "group.com.the-blue-alliance.tba.tbadata"

    public let modelContainer: ModelContainer
    public let modelExecutor: ModelExecutor

    public init() throws {
        let entities = [
            Event.self
        ]
        let schema = Schema(entities, version: TBAModelContainer.SchemaVersion)
        let configuration: ModelConfiguration = {
            // TODO: Remove
            #if DEBUG
            ModelConfiguration("TBA", schema: schema)
            #else
            ModelConfiguration("TBA", schema: schema, groupContainer: .identifier(AppGroupIdentifier))
            #endif
        }()

        modelContainer = try ModelContainer(for: schema, configurations: configuration)

        let context = ModelContext(modelContainer)
        modelExecutor = DefaultSerialModelExecutor(modelContext: context)
    }

}

extension TBAModelContainer {

    public func fetchEvent(key: String) async throws -> Event? {
        let predicate = #Predicate<Event> {
            $0.key == key
        }
        let descriptor = FetchDescriptor(predicate: predicate)
        return try modelContext.fetch(descriptor).first
    }

    public func fetchEvents(year: Int) async throws -> [Event] {
        let predicate = #Predicate<Event> {
            $0.year == year
        }
        // TODO: Remove
        let sortDescriptor = SortDescriptor(\Event.key)
        let descriptor = FetchDescriptor(predicate: predicate, sortBy: [sortDescriptor])
        return try modelContext.fetch(descriptor)
    }

    public func insert(event: Event) {
        modelContext.insert(event)
    }

    public func insert(events: [Event]) {
        for event in events {
            modelContext.insert(event)
        }
    }

}
