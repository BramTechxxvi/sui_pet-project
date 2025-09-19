module sui_pet::sui_pet {
    use std::string::String;

    public enum Species has copy, drop, store {
        Empty,
        String(String),
    }

    public enum Level has copy, drop, store {
        Empty,
        String(String),
    }

    public struct Pet has key, String {
        id: UID,
        name: String,
        species: Species,
        level: Level,
        is_hungry: bool,
    }

    public fun new_species(species:String) : Species{
        let specie = string::into_bytes(species);
        let mammal = string::into_bytes(string::utf8(b"MAMMAL"));

        if (specie == mammal) {
            Species::String(species)
        } else {
            abort 1
        }
    }

    public fun new_level(level:String) : Level{
        Level::String(level)
    }
}