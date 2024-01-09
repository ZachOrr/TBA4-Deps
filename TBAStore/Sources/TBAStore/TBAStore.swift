import Foundation
import TBAAPI
import TBAData
import SwiftData

public final class TBAStore {

    internal let api: TBAKit
    public let modelContainer: TBAModelContainer

    public convenience init(apiKey: String) throws {
        self.init(
            api: TBAKit(apiKey: apiKey),
            modelContainer: try TBAModelContainer()
        )
    }

    public init(api: TBAKit, modelContainer: TBAModelContainer) {
        self.api = api
        self.modelContainer = modelContainer
    }

}
