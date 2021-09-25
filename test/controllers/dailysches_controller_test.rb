require "test_helper"

class DailyschesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dailysch = dailysches(:one)
  end

  test "should get index" do
    get dailysches_url
    assert_response :success
  end

  test "should get new" do
    get new_dailysch_url
    assert_response :success
  end

  test "should create dailysch" do
    assert_difference('Dailysch.count') do
      post dailysches_url, params: { dailysch: { client: @dailysch.client, counsellor: @dailysch.counsellor, date: @dailysch.date, ref: @dailysch.ref, time: @dailysch.time } }
    end

    assert_redirected_to dailysch_url(Dailysch.last)
  end

  test "should show dailysch" do
    get dailysch_url(@dailysch)
    assert_response :success
  end

  test "should get edit" do
    get edit_dailysch_url(@dailysch)
    assert_response :success
  end

  test "should update dailysch" do
    patch dailysch_url(@dailysch), params: { dailysch: { client: @dailysch.client, counsellor: @dailysch.counsellor, date: @dailysch.date, ref: @dailysch.ref, time: @dailysch.time } }
    assert_redirected_to dailysch_url(@dailysch)
  end

  test "should destroy dailysch" do
    assert_difference('Dailysch.count', -1) do
      delete dailysch_url(@dailysch)
    end

    assert_redirected_to dailysches_url
  end
end
