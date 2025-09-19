module sui_pet::sui_pet {
    use std::string::String;
    use std::{debug, string};
    use sui_pet::dto;
    #[test_only]
    use sui::test_scenerio;
    public enum Species has copy, drop, store {
        Empty,
        String(String)
    }

    public enum Level has copy, drop, store {
        Empty,
        String(String)
    }

    public struct Pet has key, store {
        id: UID,
        name: String,
        species: Species,
        level: Level
        is_hungry:bool
    }


}