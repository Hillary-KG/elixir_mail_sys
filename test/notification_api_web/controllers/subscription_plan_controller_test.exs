defmodule NotificationApiWeb.SubscriptionPlanControllerTest do
  use NotificationApiWeb.ConnCase

  import NotificationApi.SubscriptionPlansFixtures

  alias NotificationApi.SubscriptionPlans.SubscriptionPlan

  @create_attrs %{
    duration: 42,
    name: "some name",
    price: 120.5,
    status: 42
  }
  @update_attrs %{
    duration: 43,
    name: "some updated name",
    price: 456.7,
    status: 43
  }
  @invalid_attrs %{duration: nil, name: nil, price: nil, status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all subscription_plans", %{conn: conn} do
      conn = get(conn, ~p"/api/subscription_plans")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create subscription_plan" do
    test "renders subscription_plan when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/subscription_plans", subscription_plan: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/subscription_plans/#{id}")

      assert %{
               "id" => ^id,
               "duration" => 42,
               "name" => "some name",
               "price" => 120.5,
               "status" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/subscription_plans", subscription_plan: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update subscription_plan" do
    setup [:create_subscription_plan]

    test "renders subscription_plan when data is valid", %{conn: conn, subscription_plan: %SubscriptionPlan{id: id} = subscription_plan} do
      conn = put(conn, ~p"/api/subscription_plans/#{subscription_plan}", subscription_plan: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/subscription_plans/#{id}")

      assert %{
               "id" => ^id,
               "duration" => 43,
               "name" => "some updated name",
               "price" => 456.7,
               "status" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, subscription_plan: subscription_plan} do
      conn = put(conn, ~p"/api/subscription_plans/#{subscription_plan}", subscription_plan: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete subscription_plan" do
    setup [:create_subscription_plan]

    test "deletes chosen subscription_plan", %{conn: conn, subscription_plan: subscription_plan} do
      conn = delete(conn, ~p"/api/subscription_plans/#{subscription_plan}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/subscription_plans/#{subscription_plan}")
      end
    end
  end

  defp create_subscription_plan(_) do
    subscription_plan = subscription_plan_fixture()
    %{subscription_plan: subscription_plan}
  end
end
