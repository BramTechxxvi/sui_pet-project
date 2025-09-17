module sui_pet::sui_pet {
    use std::string::String;

    public enum Species has copy, drop, store {
        Empty,
        String(String),
    }

    public enum Level has copy, drop, store {
        Baby,
        Adult,
    }

    public struct Pet has key {
        id: UID,
        name: String,
        species: Species,
        is_hungry: bool,
    }
}