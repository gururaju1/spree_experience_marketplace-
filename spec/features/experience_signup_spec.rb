require 'spec_helper'

feature 'ExperienceSignup', js: true do

  scenario 'existing experience' do
    @user = create(:user)
    create(:experience, email: @user.email, users: [@user])
    login_user @user
    visit spree.new_experience_path
    page.current_path.should eql(spree.account_path)
    page.should have_content("You've already signed up to become a experience.")
  end

  context 'as guest user' do

    after do
      SpreeMarketplace::Config.set(allow_signup: false)
    end

    before do
      SpreeMarketplace::Config.set(allow_signup: true)
      visit spree.new_experience_path
      page.should have_content('LOGIN')
    end

    scenario 'as business' do
      fill_in 'experience[name]', with: 'Spree'
      fill_in 'experience[first_name]', with: 'First'
      fill_in 'experience[last_name]', with: 'Last'
      fill_in 'experience[email]', with: 'spree@example.com'
      fill_in 'experience[password]', with: 'password'
      fill_in 'experience[password_confirmation]', with: 'password'
      fill_in 'experience[tax_id]', with: '000000000'
      click_button 'Sign Up'
      page.should have_content('Thank you for signing up!')
      page.should_not have_content('LOGIN')
    end

    scenario 'as individual' do
      fill_in 'experience[name]', with: 'Spree'
      fill_in 'experience[first_name]', with: 'First'
      fill_in 'experience[last_name]', with: 'Last'
      fill_in 'experience[email]', with: 'spree@example.com'
      fill_in 'experience[password]', with: 'password'
      fill_in 'experience[password_confirmation]', with: 'password'
      click_button 'Sign Up'
      page.should have_content('Thank you for signing up!')
      page.should_not have_content('LOGIN')
    end

    scenario 'should require correct password for existing user account' do
      fill_in 'experience[email]', with: create(:user).email
      fill_in 'experience[first_name]', with: 'First'
      fill_in 'experience[last_name]', with: 'Last'
      fill_in 'experience[password]', with: 'invalid'
      fill_in 'experience[password_confirmation]', with: 'invalid'
      fill_in 'experience[name]', with: 'Test Experience'
      fill_in 'experience[tax_id]', with: '000000000'
      click_on 'Sign Up'
      expect(page).to have_content("Invalid password please sign in or sign up.")
    end
  end

  context 'logged in' do

    before do
      @user = create(:user)
      login_user @user
    end

    context 'w/ DropShipConfig[:allow_signup] == false (the default)' do

      before do
        SpreeMarketplace::Config.set(allow_signup: false)
      end

      scenario 'should not be able to create new experience' do
        visit spree.account_path
        within '#user-info' do
          page.should_not have_link 'Sign Up To Become A experience'
        end
        visit spree.new_experience_path
        page.should have_content('Authorization Failure')
      end

    end

    context 'w/ DropShipConfig[:allow_signup] == true' do

      after do
        SpreeMarketplace::Config.set(allow_signup: false)
      end

      before do
        SpreeMarketplace::Config.set(allow_signup: true)
        visit spree.account_path
      end

      scenario 'should be able to create new individual experience' do
        within '#user-info' do
          click_link 'Sign Up To Become A Experience'
        end
        fill_in 'experience[name]', with: 'Test experience'
        fill_in 'experience[first_name]', with: 'First'
        fill_in 'experience[last_name]', with: 'Last'
        click_button 'Sign Up'
        page.should have_content('Thank you for signing up!')
      end

      scenario 'should be able to create new business experience' do
        within '#user-info' do
          click_link 'Sign Up To Become A experience'
        end
        fill_in 'experience[name]', with: 'Test experience'
        fill_in 'experience[first_name]', with: 'First'
        fill_in 'experience[last_name]', with: 'Last'
        fill_in 'experience[tax_id]', with: '000000000'
        click_button 'Sign Up'
        page.should have_content('Thank you for signing up!')
      end

      scenario 'should display errors with invalid experience' do
        within '#user-info' do
          click_link 'Sign Up To Become A Experience'
        end
        click_button 'Sign Up'
        page.should have_content('This field is required.')
      end

    end

  end

end