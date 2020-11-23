require 'test_helper'

class DevisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get devises_index_url
    assert_response :success
  end

end
