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
        level: Level,
        is_hungry:bool
    }

    public fun new_species(species:String) : Species{
        let allowed_species = vector<String>[
            string::utf8(b"MAMMAL"), string::utf8(b"AVES"),
            string::utf8(b"PISCES")
        ];
        let mut index = 0;
        while(index < allowed_species.length()){
            if(allowed_species[index] == species){
                return Species::String(species);
            };
            index = index + 1;
        };
        Species::Empty   
    }

    public fun new_level(level:String) :Level{
        Level::String(level)
    }

    #[allow(lint(self_tranfer))]
    public fun new_pet(create_pet_request:dto::CreatePetRequest, ctx: &mut TxContext) {
        let id = object::new(ctx);
        let species = new_species(string::utf8(b"MAMMAL"));
        let level = new_level(string::utf8(b"LEVEL_1"));
        let pet = Pet {
            id: id,
            name:ceate_pet_request.get_name(),
            species: species,
            level: level,
            is_hungry:true
        };
        debug::print(&pet);
        tranfer::public_transfer(create_pet_request, ctx.sender());
        tranfer::public_transfer(pet, ctx.sender());
    }

    #[test]
    public fun test_create_new_species(){
        let specie = string::utf8(b"AVES");
        let species = new_species(specie);
        debug::print(&species);
    }


}