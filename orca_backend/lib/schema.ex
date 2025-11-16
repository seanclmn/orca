defmodule OrcaBackendWeb.Schema do
  use Absinthe.Schema
  import_types(OrcaBackendWeb.Types.Account)

  alias OrcaBackendWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:users) do
      resolve(&Resolvers.Accounts.list_users/3)
    end
  end
end
