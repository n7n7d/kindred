require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title="Kindred.com:"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select  "title", "#{@base_title} Lowest Price Property, Find Latest Deals on Rental Property"

  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "#{@base_title} Need a little help?"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "#{@base_title} Contact us"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "#{@base_title} know about us"
  end

end
