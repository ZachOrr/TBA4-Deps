import Foundation
import SwiftData
import TBAAPI

@Model
public final class Team {
    @Attribute(.unique) public let key: String
    public let teamNumber: Int
    public let nickname: String?
    public let name: String?
    public let schoolName: String?
    public let city: String?
    public let stateProv: String?
    public let country: String?
    public let address: String?
    public let postalCode: String?
    public let gmapsPlaceID: String?
    public let gmapsURL: String?
    public let lat: Double?
    public let lng: Double?
    public let locationName: String?
    public let website: String?
    public let rookieYear: Int?
    public let homeChampionship: [String: String]?

    init(key: String, teamNumber: Int, nickname: String?, name: String?, schoolName: String?, city: String?, stateProv: String?, country: String?, address: String?, postalCode: String?, gmapsPlaceID: String?, gmapsURL: String?, lat: Double?, lng: Double?, locationName: String?, website: String?, rookieYear: Int?, homeChampionship: [String : String]?) {
        self.key = key
        self.teamNumber = teamNumber
        self.nickname = nickname
        self.name = name
        self.schoolName = schoolName
        self.city = city
        self.stateProv = stateProv
        self.country = country
        self.address = address
        self.postalCode = postalCode
        self.gmapsPlaceID = gmapsPlaceID
        self.gmapsURL = gmapsURL
        self.lat = lat
        self.lng = lng
        self.locationName = locationName
        self.website = website
        self.rookieYear = rookieYear
        self.homeChampionship = homeChampionship
    }
}

extension Team {
    public convenience init(api model: APITeam) {
        self.init(
            key: model.key,
            teamNumber: model.teamNumber,
            nickname: model.nickname,
            name: model.name,
            schoolName: model.schoolName,
            city: model.city,
            stateProv: model.stateProv,
            country: model.country,
            address: model.address,
            postalCode: model.postalCode,
            gmapsPlaceID: model.gmapsPlaceID,
            gmapsURL: model.gmapsURL,
            lat: model.lat,
            lng: model.lng,
            locationName: model.locationName,
            website: model.website,
            rookieYear: model.rookieYear,
            homeChampionship: model.homeChampionship
        )
    }
}
