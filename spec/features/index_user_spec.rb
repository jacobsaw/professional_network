require 'rails_helper'

RSpec.describe 'showing users' do
	before do
	    @user = User.create(name:"Amadeus Mozart", email:"amad@gmail.com", password:"password", description:"simply the best")
	    visit '/main'
	    fill_in 'email', with: 'amad@gmail.com'
	    fill_in 'password', with: 'password'
	    click_button 'Login'
  	end
  	it 'has a users route which goes to users index page' do
  		visit '/users/'
  		expect(current_path).to eq("/users/")
  		expect(page).to have_text('Users you may want to connect with')
  	end
end
