import Foundation
import SwiftData
import TBAAPI

@Model
public final class Webcast {
    @Attribute(.unique) public let key: String
    public let type: String
    public let channel: String
    public let file: String?
    public let date: Date?

    init(type: String, channel: String, file: String?, date: Date?) {
        self.key = "\(type)_\(channel)"
        self.type = type
        self.channel = channel
        self.file = file
        self.date = date
    }
}

extension Webcast {
    public convenience init(api model: APIWebcast) {
        self.init(type: model.type, channel: model.channel, file: model.file, date: model.date)
    }
}
