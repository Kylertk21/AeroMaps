require "test_helper"

class FlightPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flight_plan = flight_plans(:one)
  end

  test "should get index" do
    get flight_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_flight_plan_url
    assert_response :success
  end

  test "should create flight_plan" do
    assert_difference("FlightPlan.count") do
      post flight_plans_url, params: { flight_plan: { cruising_altitude: @flight_plan.cruising_altitude, departure: @flight_plan.departure, extra_info: @flight_plan.extra_info, first_landing: @flight_plan.first_landing, fuel_hours: @flight_plan.fuel_hours, number_of_passengers: @flight_plan.number_of_passengers, route: @flight_plan.route, time_of_departure: @flight_plan.time_of_departure, time_until_first: @flight_plan.time_until_first, true_airspeed: @flight_plan.true_airspeed } }
    end

    assert_redirected_to flight_plan_url(FlightPlan.last)
  end

  test "should show flight_plan" do
    get flight_plan_url(@flight_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_flight_plan_url(@flight_plan)
    assert_response :success
  end

  test "should update flight_plan" do
    patch flight_plan_url(@flight_plan), params: { flight_plan: { cruising_altitude: @flight_plan.cruising_altitude, departure: @flight_plan.departure, extra_info: @flight_plan.extra_info, first_landing: @flight_plan.first_landing, fuel_hours: @flight_plan.fuel_hours, number_of_passengers: @flight_plan.number_of_passengers, route: @flight_plan.route, time_of_departure: @flight_plan.time_of_departure, time_until_first: @flight_plan.time_until_first, true_airspeed: @flight_plan.true_airspeed } }
    assert_redirected_to flight_plan_url(@flight_plan)
  end

  test "should destroy flight_plan" do
    assert_difference("FlightPlan.count", -1) do
      delete flight_plan_url(@flight_plan)
    end

    assert_redirected_to flight_plans_url
  end
end
