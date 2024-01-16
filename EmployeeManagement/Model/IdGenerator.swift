import Foundation

class IdGenerator 
{
    static let sharedInstance = IdGenerator()

    private init() {}

    func generate() -> String
    {
        let randomId = Int.random(in: 0...999999) // Adjusted range to ensure a 6-digit number
        let sixCharacterString = String(format: "%06d", randomId)
        return sixCharacterString
    }
}
