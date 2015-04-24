class SessionsControllerTest < ActionController::TestCase
  test 'should destroy session' do
    post :destroy
    assert_redirected_to controller: 'home', action: 'show'
  end
end