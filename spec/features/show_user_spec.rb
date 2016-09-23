require 'rails_helper'

RSpec.describe 'show specific user' do
	before do
	    @user = User.create(name:"Amadeus Mozart", email:"amad@gmail.com", password:"password", description:"simply the best")
	    visit '/main'
	    fill_in 'email', with: 'amad@gmail.com'
	    fill_in 'password', with: 'password'
	    click_button 'Login'
  	end
  	it 'has a show route which displays information about a specific user' do
  		visit "/users/#{@user.id}"
  		expect(page).to have_text('Amadeus Mozart')
  	end
end
