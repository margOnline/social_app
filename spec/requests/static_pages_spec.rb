require 'spec_helper'

describe "StaticPages" do

  let (:base_title) {'Social App'}

  describe "Home page" do
    it "should have the content 'Social App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Social App')
    end

    it "should have the title 'Social App'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title}")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).to_not have_title("#{base_title} | Home")
    end
  end

 describe "Help page" do
    it "should have the content 'Help Page'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help Page')
    end

    it "should have the title 'Social App | Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end

   describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'Social App | About'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Social App | Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end
