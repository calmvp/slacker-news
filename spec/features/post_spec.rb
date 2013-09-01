require 'spec_helper'

describe 'Post creation' do
  let!(:user) { FactoryGirl.create(:user) }
  context 'user creates a new post' do
    it 'creates a new post and redirects user to post page' do
      visit root_url
      click_link "Sign In"

      fill_in 'email', with: "ned@gmail.com"
      fill_in 'password', with: "password"
      click_button 'Sign In'
      
      visit new_post_url
      
      expect{
        fill_in 'post_title', with: "Slackin'"
        fill_in 'post_body', with: "Slackin' hard. Like a champ."
        fill_in 'post_tags', with: "slaaack chaaaamp" 
        click_button 'Submit Post'
      }.to change(Post, :count).by 1

      Post.last.tags.count.should eq 2

      page.should have_content "Slackin'"
      page.should have_content "Slackin' hard. Like a champ."
      page.should have_content "slaaack"
      page.should have_content "chaaaamp"
    end
  end
end
