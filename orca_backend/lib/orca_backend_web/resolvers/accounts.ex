defmodule OrcaBackendWeb.Resolvers.Accounts do
  def search_users(_parent, args, _resolution) do
    OrcaBackend.Accounts.search_users(args)
  end

  def fetch_user(_parent, %{id: id}, _resolution) do
    OrcaBackend.Accounts.fetch_user(id)
  end
end
