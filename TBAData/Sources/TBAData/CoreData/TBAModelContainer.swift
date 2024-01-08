//
//  TBAModelContainer.swift
//
//
//  Created by Zachary Orr on 1/8/24.
//

import Foundation
import SwiftData

public class TBAModelContainer {

    private static let SchemaVersion: Schema.Version = Schema.Version(1, 0, 0)
    // private static let AppGroupIdentifier = "group.com.the-blue-alliance.tba.tbadata"

    public static func createModelContainer() throws -> ModelContainer {
        let types = [
            Event.self
        ]
        let schema = Schema(types, version: SchemaVersion)
        // let configuration = ModelConfiguration("TBA", schema: schema, groupContainer: .identifier(AppGroupIdentifier))
        let configuration = ModelConfiguration("TBA", schema: schema)
        return try ModelContainer(for: schema, configurations: configuration)
    }

}
