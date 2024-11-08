require "application_system_test_case"

class FlightPlansTest < ApplicationSystemTestCase
  setup do
    @flight_plan = flight_plans(:one)
  end

  test "visiting the index" do
    visit flight_plans_url
    assert_selector "h1", text: "Flight plans"
  end

  test "should create flight plan" do
    visit flight_plans_url
    click_on "New flight plan"

    fill_in "Cruising altitude", with: @flight_plan.cruising_altitude
    fill_in "Departure", with: @flight_plan.departure
    fill_in "Extra info", with: @flight_plan.extra_info
    fill_in "First landing", with: @flight_plan.first_landing
    fill_in "Fuel hours", with: @flight_plan.fuel_hours
    fill_in "Number of passengers", with: @flight_plan.number_of_passengers
    fill_in "Route", with: @flight_plan.route
    fill_in "Time of departure", with: @flight_plan.time_of_departure
    fill_in "Time until first", with: @flight_plan.time_until_first
    fill_in "True airspeed", with: @flight_plan.true_airspeed
    click_on "Create Flight plan"

    assert_text "Flight plan was successfully created"
    click_on "Back"
  end

  test "should update Flight plan" do
    visit flight_plan_url(@flight_plan)
    click_on "Edit this flight plan", match: :first

    fill_in "Cruising altitude", with: @flight_plan.cruising_altitude
    fill_in "Departure", with: @flight_plan.departure
    fill_in "Extra info", with: @flight_plan.extra_info
    fill_in "First landing", with: @flight_plan.first_landing
    fill_in "Fuel hours", with: @flight_plan.fuel_hours
    fill_in "Number of passengers", with: @flight_plan.number_of_passengers
    fill_in "Route", with: @flight_plan.route
    fill_in "Time of departure", with: @flight_plan.time_of_departure
    fill_in "Time until first", with: @flight_plan.time_until_first
    fill_in "True airspeed", with: @flight_plan.true_airspeed
    click_on "Update Flight plan"

    assert_text "Flight plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Flight plan" do
    visit flight_plan_url(@flight_plan)
    click_on "Destroy this flight plan", match: :first

    assert_text "Flight plan was successfully destroyed"
  end
end
