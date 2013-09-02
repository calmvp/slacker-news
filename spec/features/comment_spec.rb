require 'spec_helper'

describe 'Comment Creation' do
  let!(:user) { FactoryGirl.create(:user) }
  context 'User can comment on a post do' do
  	it 'can create a comment associated with a particular post and view it' do
  	  sign_in_user

  	  post = user.posts.create(title: "Slackin'", body: "Slackin' hard. Like a champ.", tag_names: "slaaack chaaaamp")

  	  visit post_url(post)

  	  expect{
  	  	fill_in 'comment_body', with: "Someday I will not work, just like you"
  	  	click_button 'Comment'
  	  }.to change(Comment, :count).by 1

  	  User.find_by_email("ned@gmail.com").comments.count.should eq 1

  	  page.should have_content "Someday I will not work, just like you"
  	end
  end
end

