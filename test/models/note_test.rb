require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test 'should not save note without user' do
    note = Note.new(text: 'text')
    assert_not note.save
  end
  test 'should not save note without text' do
    note = Note.new(user: User.new(provider: 'provider', uid: 'uid', name: 'name', email: 'email',
                                   oauth_token: 'oauth_token', oauth_expires_at: 'oauth_expires_at'))
    assert_not note.save
  end
end