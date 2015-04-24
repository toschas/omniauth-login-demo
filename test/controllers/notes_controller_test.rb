class NotesControllerTest < ActionController::TestCase
  test 'notes controller should get redirected when not logged in' do
    get :index
    assert_redirected_to(controller: 'home', action: 'show')
  end
end