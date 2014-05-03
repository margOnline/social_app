require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    it "should have the content 'Social App'" do
      visit '/static_pages/home'
      expect (page).to have_content ('Social App')
    end

    it "should have the content 'Social App | Home'" do
      visit '/static_pages/home'
      expect (page).to have_title ('Social App | Home')
    end
  end

 describe "Help page" do
    it "should have the content 'Help Page'" do
      visit '/static_pages/help'
      expect (page).to have_content ('Help Page')
    end

    it "should have the title 'Social App | Help'" do
      visit '/static_pages/help'
      expect (page).to have_title ('Social App | Help')
    end
  end

   describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect (page).to have_content ('About')
    end

    it "should have the content 'Social | About'" do
      visit '/static_pages/about'
      expect (page).to have_title ('Social App | About')
    end
  end
end
