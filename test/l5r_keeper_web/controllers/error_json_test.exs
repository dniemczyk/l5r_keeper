defmodule L5rKeeperWeb.ErrorJSONTest do
  use L5rKeeperWeb.ConnCase, async: true

  test "renders 404" do
    assert L5rKeeperWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert L5rKeeperWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
