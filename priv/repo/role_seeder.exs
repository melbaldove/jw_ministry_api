defmodule JwMinistryApi.RoleSeeder do
  alias JwMinistryApi.Repo
  alias JwMinistryApi.Role

  @roles_list ~w(ADMIN GO REGULAR)

  def insert_roles do
    Repo.delete_all Role
    @roles_list
    |> Enum.each(fn x ->
         Repo.insert! %Role{
           name: x
         } 
       end)
  end
end