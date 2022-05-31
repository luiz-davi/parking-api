module Mutations
  class DesableUser < Mutations::BaseMutation

    field :result, Boolean, null: false

    def resolve
      check_authentication
      
      current_user.destroy

      { result: true }
    end
  end
end