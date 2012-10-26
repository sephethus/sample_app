require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    
  end

  describe "Check Links" do   
    
    it "should have the right links on the layout" do
      visit root_path

      click_link "About"
      
      page.should have_full_title('About')

      click_link "Help"
      
      page.should have_full_title('Help')
      
      click_link "Contact"
      
      page.should have_full_title('Contact')
      
      click_link "Home"

      page.should have_selector 'title', text: full_title('')
      
      click_link "Sign up now!"
      
      page.should have_full_title('Sign up')
      
      click_link "sample app"
      
      page.should have_selector 'title', text: full_title('')
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_full_title('Help') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_full_title('About') }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_full_title('Contact') }
  end


end

