module Mutations
  class DisableUser < Mutations::BaseMutation

    field :result, Boolean, null: false

    def resolve
      check_authentication
      
      current_user.destroy

      { result: true }
    end
  end
end