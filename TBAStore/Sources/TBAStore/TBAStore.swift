import Foundation
import TBAAPI
import TBAData
import SwiftData

public final class TBAStore {

    let api: TBAKit
    public let modelContainer: ModelContainer

    public convenience init(apiKey: String) throws {
        self.init(
            api: TBAKit(apiKey: apiKey),
            modelContainer: try TBAModelContainer.createModelContainer()
        )
    }

    public init(api: TBAKit, modelContainer: ModelContainer) {
        self.api = api
        self.modelContainer = modelContainer
    }

}
