import Foundation
import SwiftData
import TBAAPI

@Model
public final class Match {
    @Attribute(.unique) public let key: String
    public let compLevel: String
    public let setNumber: Int
    public let matchNumber: Int
    public let alliances: [String: MatchAlliance]?
    public let winningAlliance: String?
    public let eventKey: String
    public let time: Int64?
    public let actualTime: Int64?
    public let predictedTime: Int64?
    public let postResultTime: Int64?
    // public let breakdown: [String: Any]?
    public let videos: [MatchVideo]?

    init(key: String, compLevel: String, setNumber: Int, matchNumber: Int, alliances: [String : MatchAlliance]?, winningAlliance: String?, eventKey: String, time: Int64?, actualTime: Int64?, predictedTime: Int64?, postResultTime: Int64?, videos: [MatchVideo]?) {
        self.key = key
        self.compLevel = compLevel
        self.setNumber = setNumber
        self.matchNumber = matchNumber
        self.alliances = alliances
        self.winningAlliance = winningAlliance
        self.eventKey = eventKey
        self.time = time
        self.actualTime = actualTime
        self.predictedTime = predictedTime
        self.postResultTime = postResultTime
        self.videos = videos
    }
}

extension Match {
    public convenience init(api model: APIMatch) {
        self.init(
            key: model.key,
            compLevel: model.compLevel,
            setNumber: model.setNumber,
            matchNumber: model.matchNumber,
            alliances: model.alliances?.mapValues { MatchAlliance(api: $0) },
            winningAlliance: model.winningAlliance,
            eventKey: model.eventKey,
            time: model.time,
            actualTime: model.actualTime,
            predictedTime: model.predictedTime,
            postResultTime: model.postResultTime,
            // breakdown: model.breakdown,
            videos: model.videos?.map { MatchVideo(api: $0) }
        )
    }
}
