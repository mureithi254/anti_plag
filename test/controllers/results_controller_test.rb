require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get crawl" do
    get results_crawl_url
    assert_response :success
  end

  test "should get nokogiri" do
    get results_nokogiri_url
    assert_response :success
  end

  test "should get compare" do
    get results_compare_url
    assert_response :success
  end

  test "should get results" do
    get results_results_url
    assert_response :success
  end

end
