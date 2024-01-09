import Foundation
import SwiftData
import TBAAPI

@Model
public final class Event {
    @Attribute(.unique) public let key: String
    public let name: String
    public let eventCode: String
    public let eventType: Int
    public let district: District?
    public let city: String?
    public let stateProv: String?
    public let country: String?
    public let startDate: Date
    public let endDate: Date
    public let year: Int
    public let shortName: String?
    public let eventTypeString: String?
    public let week: Int?
    public let address: String?
    public let postalCode: String?
    public let gmapsPlaceID: String?
    public let gmapsURL: String?
    public let lat: Double?
    public let lng: Double?
    public let locationName: String?
    public let timezone: String?
    public let website: String?
    public let firstEventID: String?
    public let firstEventCode: String?
    public let webcasts: [Webcast]
    public let divisionKeys: [String]
    public let parentEventKey: String?
    public let playoffType: Int?
    public let playoffTypeString: String?
    
    init(key: String, name: String, eventCode: String, eventType: Int, district: District?, city: String?, stateProv: String?, country: String?, startDate: Date, endDate: Date, year: Int, shortName: String?, eventTypeString: String?, week: Int?, address: String?, postalCode: String?, gmapsPlaceID: String?, gmapsURL: String?, lat: Double?, lng: Double?, locationName: String?, timezone: String?, website: String?, firstEventID: String?, firstEventCode: String?, webcasts: [Webcast], divisionKeys: [String], parentEventKey: String?, playoffType: Int?, playoffTypeString: String?) {
        self.key = key
        self.name = name
        self.eventCode = eventCode
        self.eventType = eventType
        self.district = district
        self.city = city
        self.stateProv = stateProv
        self.country = country
        self.startDate = startDate
        self.endDate = endDate
        self.year = year
        self.shortName = shortName
        self.eventTypeString = eventTypeString
        self.week = week
        self.address = address
        self.postalCode = postalCode
        self.gmapsPlaceID = gmapsPlaceID
        self.gmapsURL = gmapsURL
        self.lat = lat
        self.lng = lng
        self.locationName = locationName
        self.timezone = timezone
        self.website = website
        self.firstEventID = firstEventID
        self.firstEventCode = firstEventCode
        self.webcasts = webcasts
        self.divisionKeys = divisionKeys
        self.parentEventKey = parentEventKey
        self.playoffType = playoffType
        self.playoffTypeString = playoffTypeString
    }
}

extension Event: CustomStringConvertible {
    public var description: String {
        return "Event(\(key))"
    }
}

extension Event {
    public convenience init(_ model: APIEvent) {
        // TODO: These models are problematic - they need to be inserted?
        self.init(
            key: model.key,
            name: model.name,
            eventCode: model.eventCode,
            eventType: model.eventType,
            // district: District(model.district),
            district: nil,
            city: model.city,
            stateProv: model.stateProv,
            country: model.country,
            startDate: model.startDate,
            endDate: model.endDate,
            year: model.year,
            shortName: model.shortName,
            eventTypeString: model.eventTypeString,
            week: model.week,
            address: model.address,
            postalCode: model.postalCode,
            gmapsPlaceID: model.gmapsPlaceID,
            gmapsURL: model.gmapsURL,
            lat: model.lat,
            lng: model.lng,
            locationName: model.locationName,
            timezone: model.timezone,
            website: model.website,
            firstEventID: model.firstEventID,
            firstEventCode: model.firstEventCode,
            webcasts: model.webcasts?.map { Webcast(api: $0) } ?? [],
            divisionKeys: model.divisionKeys,
            parentEventKey: model.parentEventKey,
            playoffType: model.playoffType,
            playoffTypeString: model.playoffTypeString
        )
    }
}
