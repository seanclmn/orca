defmodule OrcaBackendWeb.Types.Account do
  use Absinthe.Schema.Notation

  object :users do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    field(:age, :integer)
  end
end
