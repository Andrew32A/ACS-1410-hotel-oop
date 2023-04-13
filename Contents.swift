class Hotel {
    var address: String
    var numberOfRooms: Int
    var managerName: String
    var rooms: [Room]

    init(address: String, numberOfRooms: Int, managerName: String) {
        self.address = address
        self.numberOfRooms = numberOfRooms
        self.managerName = managerName
        self.rooms = []
    }

    func addRoom(_ room: Room) {
        rooms.append(room)
    }

    func findRoom(byNumber number: Int) -> Room? {
        return rooms.first { $0.number == number }
    }
}

class Room {
    var number: Int
    var type: RoomType
    var price: Double
    var isBooked: Bool = false

    var nightlyRate: Double {
        return price
    }

    init(number: Int, type: RoomType, price: Double) {
        self.number = number
        self.type = type
        self.price = price
    }
}

enum RoomType {
    case single
    case double
    case triple
    case quad

    var capacity: Int {
        switch self {
        case .single:
            return 1
        case .double:
            return 2
        case .triple:
            return 3
        case .quad:
            return 4
        }
    }
}

class Guest {
    var name: String
    var hasPet: Bool = false

    init(name: String, hasPet: Bool = false) {
        self.name = name
        self.hasPet = hasPet
    }
}

class Booking {
    var guest: Guest
    var room: Room
    var numberOfDays: Int

    var totalPrice: Double {
        var price = Double(numberOfDays) * room.nightlyRate
        if guest.hasPet {
            price += 25.0
        }
        return price
    }

    init(guest: Guest, room: Room, numberOfDays: Int) {
        self.guest = guest
        self.room = room
        self.numberOfDays = numberOfDays
    }
}

// testing output
var hotel = Hotel(address: "123 Main St", numberOfRooms: 10, managerName: "John Smith")

hotel.addRoom(Room(number: 101, type: .single, price: 10.0))
hotel.addRoom(Room(number: 102, type: .double, price: 20.0))
hotel.addRoom(Room(number: 103, type: .triple, price: 30.0))
hotel.addRoom(Room(number: 104, type: .quad, price: 40.0))

// find a room by number
if let room = hotel.findRoom(byNumber: 102) {
    let guest = Guest(name: "Jane Doe", hasPet: true)
    let booking = Booking(guest: guest, room: room, numberOfDays: 5)
    print("Booking for \(guest.name) in room \(room.number) for \(booking.numberOfDays) days. Total price: $\(booking.totalPrice). Enjoy your stay!")
} else {
    print("Room not found")
}
