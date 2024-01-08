import Foundation
import SwiftData
import TBAAPI

@Model
public final class District {
    @Attribute(.unique) public let key: String
    public let abbreviation: String
    public let name: String
    public let year: Int

    init(key: String, abbreviation: String, name: String, year: Int) {
        self.key = key
        self.abbreviation = abbreviation
        self.name = name
        self.year = year
    }
}

extension District {
    public convenience init?(_ model: APIDistrict?) {
        guard let model else {
            return nil
        }
        self.init(key: model.key, abbreviation: model.abbreviation, name: model.name, year: model.year)
    }
}
