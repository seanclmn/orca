defmodule OrcaBackendWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern
  import_types(OrcaBackendWeb.Types.Account)

  alias OrcaBackendWeb.Resolvers

  node interface do
    resolve_type(fn
      # User struct → :user type
      %OrcaBackend.Accounts.User{}, _ -> :user
    end)
  end

  query do
    # @desc "Get all users"
    # connection field(:search_users), node_type: :user do
    #   arg(:name, :string)
    #   resolve(&Resolvers.Accounts.search_users/3)
    # end

    @desc "Get a user by ID"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.fetch_user/3)
    end
  end
end
