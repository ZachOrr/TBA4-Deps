import Foundation
import SwiftData
import TBAAPI

@Model
public final class MatchAlliance: Codable {
    public let score: Int
    public let teamKeys: [String]
    public let surrogateTeamKeys: [String]?
    public let dqTeamKeys: [String]?

    enum CodingKeys: String, CodingKey {
        case score
        case teamKeys = "team_keys"
        case surrogateTeamKeys = "surrogate_team_keys"
        case dqTeamKeys = "dq_team_keys"
    }

    init(score: Int, teamKeys: [String], surrogateTeamKeys: [String]?, dqTeamKeys: [String]?) {
        self.score = score
        self.teamKeys = teamKeys
        self.surrogateTeamKeys = surrogateTeamKeys
        self.dqTeamKeys = dqTeamKeys
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        score = try values.decode(Int.self, forKey: .score)
        teamKeys = try values.decode([String].self, forKey: .teamKeys)
        surrogateTeamKeys = try values.decode([String]?.self, forKey: .surrogateTeamKeys)
        dqTeamKeys = try values.decode([String]?.self, forKey: .dqTeamKeys)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(score, forKey: .score)
        try container.encode(teamKeys, forKey: .teamKeys)
        try container.encode(surrogateTeamKeys, forKey: .surrogateTeamKeys)
        try container.encode(dqTeamKeys, forKey: .dqTeamKeys)
    }
}

extension MatchAlliance {
    public convenience init(api model: APIMatchAlliance) {
        self.init(
            score: model.score,
            teamKeys: model.teamKeys,
            surrogateTeamKeys: model.surrogateTeamKeys,
            dqTeamKeys: model.dqTeamKeys
        )
    }
}
