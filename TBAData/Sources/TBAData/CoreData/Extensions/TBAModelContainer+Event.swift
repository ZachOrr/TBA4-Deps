import Foundation

/*
extension Event {

    public static func insert(_ model: APIEvent, in container: ModelContainer) -> Event {
        let context = ModelContext(container)
        let event = Event(api: model)
        context.insert(event)
        return event
    }

    public static func insert(_ models: [APIEvent], in container: ModelContainer) throws -> [Event] {
        let context = ModelContext(container)
        let events = models.map {
            let event = Event(api: $0)
            context.insert(event)
            return event
        }
        try context.save()
        return events
    }
}
*/

public extension TBAModelContainer {

}
