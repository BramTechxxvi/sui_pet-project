module sui_pet::dto{
    use std::string::String;

    public struct CreatePetRequest has key, store {
        id: UID,
        name: String,
    }

    public fun create_pet_request(name: String, ctx: &mut TxContext) : CreatePetRequest {
        let request = CreatePetRequest {
            id:object::new(ctx),
            name:name
        };
        request
    }

    public fun get_name(request: &CreatePetRequest) : String {
        request.name
    }
}