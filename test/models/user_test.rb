require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without provider' do
    user = User.new(uid: 'uid', name: 'name', email: 'email', oauth_token: 'oauth_token',
                    oauth_expires_at: 'oauth_expires_at')
    assert_not user.save
  end
  test 'should not save user without uid' do
    user = User.new(provider: 'provider', name: 'name', email: 'email', oauth_token: 'oauth_token',
                    oauth_expires_at: 'oauth_expires_at')
    assert_not user.save
  end
  test 'should not save user without name' do
    user = User.new(provider: 'provider', uid: 'uid', email: 'email', oauth_token: 'oauth_token',
                    oauth_expires_at: 'oauth_expires_at')
    assert_not user.save
  end
  test 'should not save user without email' do
    user = User.new(provider: 'provider', uid: 'uid', name: 'name', oauth_token: 'oauth_token',
                    oauth_expires_at: 'oauth_expires_at')
    assert_not user.save
  end
  test 'should not save user without oauth_token' do
    user = User.new(provider: 'provider', uid: 'uid', name: 'name', email: 'email', oauth_expires_at: 'oauth_expires_at')
    assert_not user.save
  end
  test 'should not save user without oauth_expires_at' do
    user = User.new(provider: 'provider', uid: 'uid', name: 'name', email: 'email', oauth_token: 'oauth_token')
    assert_not user.save
  end
end