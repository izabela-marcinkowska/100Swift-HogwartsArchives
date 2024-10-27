//
//  Student.swift
//  HogwartsArchives
//
//  Created by Izabela Marcinkowska on 2024-10-25.
//

import Foundation
import SwiftData

@Model
class Student: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var alternate_names: [String]
    var species: String?
    var gender: String?
    var house: String?
    var dateOfBirth: String?
    var yearOfBirth: Int?
    var wizard: Bool
    var ancestry: String?
    var eyeColour: String?
    var hairColour: String?
    var wand: Wand?
    var patronus: String?
    var hogwartsStudent: Bool
    var hogwartsStaff: Bool
    var actor: String?
    var alternate_actors: [String]
    var alive: Bool
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case alternate_names = "alternate_names"
        case species
        case gender
        case house
        case dateOfBirth
        case yearOfBirth
        case wizard
        case ancestry
        case eyeColour
        case hairColour
        case wand
        case patronus
        case hogwartsStudent
        case hogwartsStaff
        case actor
        case alternate_actors = "alternate_actors"
        case alive
        case image
    }
    
    init(id: String, name: String, alternate_names: [String], species: String?, gender: String?, house: String?, dateOfBirth: String?, yearOfBirth: Int?, wizard: Bool, ancestry: String?, eyeColour: String?, hairColour: String?, wand: Wand?, patronus: String?, hogwartsStudent: Bool, hogwartsStaff: Bool, actor: String?, alternate_actors: [String], alive: Bool, image: String?) {
        self.id = id
        self.name = name
        self.alternate_names = alternate_names
        self.species = species
        self.gender = gender
        self.house = house
        self.dateOfBirth = dateOfBirth
        self.yearOfBirth = yearOfBirth
        self.wizard = wizard
        self.ancestry = ancestry
        self.eyeColour = eyeColour
        self.hairColour = hairColour
        self.wand = wand
        self.patronus = patronus
        self.hogwartsStudent = hogwartsStudent
        self.hogwartsStaff = hogwartsStaff
        self.actor = actor
        self.alternate_actors = alternate_actors
        self.alive = alive
        self.image = image
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        alternate_names = try container.decode([String].self, forKey: .alternate_names)
        species = try container.decodeIfPresent(String.self, forKey: .species)
        gender = try container.decodeIfPresent(String.self, forKey: .gender)
        house = try container.decodeIfPresent(String.self, forKey: .house)
        dateOfBirth = try container.decodeIfPresent(String.self, forKey: .dateOfBirth)
        yearOfBirth = try container.decodeIfPresent(Int.self, forKey: .yearOfBirth)
        wizard = try container.decode(Bool.self, forKey: .wizard)
        ancestry = try container.decodeIfPresent(String.self, forKey: .ancestry)
        eyeColour = try container.decodeIfPresent(String.self, forKey: .eyeColour)
        hairColour = try container.decodeIfPresent(String.self, forKey: .hairColour)
        wand = try container.decodeIfPresent(Wand.self, forKey: .wand)
        patronus = try container.decodeIfPresent(String.self, forKey: .patronus)
        hogwartsStudent = try container.decode(Bool.self, forKey: .hogwartsStudent)
        hogwartsStaff = try container.decode(Bool.self, forKey: .hogwartsStaff)
        actor = try container.decodeIfPresent(String.self, forKey: .actor)
        alternate_actors = try container.decode([String].self, forKey: .alternate_actors)
        alive = try container.decode(Bool.self, forKey: .alive)
        image = try container.decodeIfPresent(String.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(alternate_names, forKey: .alternate_names)
        try container.encodeIfPresent(species, forKey: .species)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(house, forKey: .house)
        try container.encodeIfPresent(dateOfBirth, forKey: .dateOfBirth)
        try container.encodeIfPresent(yearOfBirth, forKey: .yearOfBirth)
        try container.encode(wizard, forKey: .wizard)
        try container.encodeIfPresent(ancestry, forKey: .ancestry)
        try container.encodeIfPresent(eyeColour, forKey: .eyeColour)
        try container.encodeIfPresent(hairColour, forKey: .hairColour)
        try container.encodeIfPresent(wand, forKey: .wand)
        try container.encodeIfPresent(patronus, forKey: .patronus)
        try container.encode(hogwartsStudent, forKey: .hogwartsStudent)
        try container.encode(hogwartsStaff, forKey: .hogwartsStaff)
        try container.encodeIfPresent(actor, forKey: .actor)
        try container.encode(alternate_actors, forKey: .alternate_actors)
        try container.encode(alive, forKey: .alive)
        try container.encodeIfPresent(image, forKey: .image)
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

@Model
class Wand: Codable, Hashable {
    var wood: String?
    var core: String?
    var length: Double?
    
    enum CodingKeys: String, CodingKey {
        case wood
        case core
        case length
    }
    
    init(wood: String?, core: String?, length: Double?) {
        self.wood = wood
        self.core = core
        self.length = length
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        wood = try container.decodeIfPresent(String.self, forKey: .wood)
        core = try container.decodeIfPresent(String.self, forKey: .core)
        
        // Handle length being a String or a Double, or empty
        if let lengthString = try? container.decode(String.self, forKey: .length), let lengthValue = Double(lengthString) {
            length = lengthValue
        } else if let lengthDouble = try? container.decode(Double.self, forKey: .length) {
            length = lengthDouble
        } else {
            length = nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(wood, forKey: .wood)
        try container.encodeIfPresent(core, forKey: .core)
        if let length = length {
            try container.encode(length, forKey: .length)
        }
    }
    
    static func == (lhs: Wand, rhs: Wand) -> Bool {
        lhs.wood == rhs.wood && lhs.core == rhs.core && lhs.length == rhs.length
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(wood)
        hasher.combine(core)
        hasher.combine(length)
    }
}
