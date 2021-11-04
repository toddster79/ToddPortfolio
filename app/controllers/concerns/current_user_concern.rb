module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        super || guest_user
    end

    def guest_user
        OpenStruct.new(
            name: "Guest User", 
            first_name: "Guest", l
            ast_name: "User", 
            email: "guest@example.com"
        )
    end
    
end