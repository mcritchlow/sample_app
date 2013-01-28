include ApplicationHelper

#remove need for redundant tests for error message, use "have_error"
#￼replace this: should have_selector('div.alert.alert-error', text: 'Invalid
# with this: should have_error_message('Invalid')
RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end