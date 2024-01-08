import Foundation
import SwiftData
import TBAAPI

@Model
public final class MatchVideo {
    @Attribute(.unique) public let key: String
    public let type: String

    init(key: String, type: String) {
        self.key = key
        self.type = type
    }
}

extension MatchVideo {
    public convenience init(api model: APIMatchVideo) {
        self.init(
            key: model.key,
            type: model.type
        )
    }
}
