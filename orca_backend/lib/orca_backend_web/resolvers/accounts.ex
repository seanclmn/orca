defmodule OrcaBackendWeb.Resolvers.Accounts do
  def list_users(_parent, _args, _resolution) do
    {:ok, OrcaBackend.Accounts.list_users()}
  end
end
