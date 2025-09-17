module sui_pet::sui_pet {
    use std::string::String;

    public enum Species has copy, drop{
        Empty,
        String(String),
    }

    public struct Pet has key {
        id: UID,
        name: String,
        species: Species,
    }
}