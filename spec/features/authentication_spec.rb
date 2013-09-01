require 'spec_helper'

describe 'User authentication' do
  let!(:user) { FactoryGirl.create(:user) }
  context 'when user signs-in' do
    it 'signs the user in and sent to profile' do
      visit root_url
      click_link "Sign In"

      fill_in 'email', with: "ned@gmail.com"
      fill_in 'password', with: "password"
      click_button 'Sign In'
      
      page.should have_content "Welcome, ned"
      page.should have_content ('Sign Out')
    end
  end
  context 'when user signs-up' do
    it 'signs the user up and sends them to profile' do
      visit root_url
      click_link "Sign Up"
      
      expect {
      fill_in 'name', with: "ned"
      fill_in 'email', with: "neds@gmail.com"
      fill_in 'password', with: "password"
      fill_in 'password confirmation', with: "password"
      click_button 'Register'}.to change(User, :count).by 1
      
      page.should have_content "Welcome, ned"
      page.should have_content ('Sign Out')
    end
  end
  context 'when user signs-out' do
    it 'signs the user out and sends them to index' do
    visit root_url
    click_link "Sign In"   
    
    fill_in 'email', with: "ned@gmail.com"
    fill_in 'password', with: "password"
    click_button 'Sign In'

    click_link 'Sign Out'
    page.should have_selector('a', text: 'Sign In')
    end
  end
end
