defmodule OrcaBackendWeb.Types.Account do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  import Absinthe.Relay.Node, only: [to_global_id: 3]
  import Absinthe.Resolution.Helpers

  node object(:user) do
    field(:name, :string)
    field(:email, :string)
    field(:age, :integer)
  end

  # connection field(:search_users, node_type: :user) do
  #   arg(:name, :string)

  #   resolve(OrcaBackendWeb.Resolvers.Accounts.list_users() / 3)
  # end
end
