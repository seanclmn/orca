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
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.Accounts.list_users/3)
    end
  end
end
