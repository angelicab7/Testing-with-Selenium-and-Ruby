require "selenium-webdriver"
require "rspec"

# TEST: Sign up for blog
describe "Blog application" do
    describe "signup to the blog application" do
        it "confirm that a user can succesfully signup" do
            timestamp = Time.now.to_i
            driver = Selenium::WebDriver.for :firefox

            # Go to sign up blog 
            driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

            # Fill out and submit form
            username_field = driver.find_element(id: "user-username") 
            username_field.send_keys("Angelica #{timestamp}")

            email_field = driver.find_element(id: "user-email")
            email_field.send_keys("angelicabonilla723 #{timestamp}@gmail.com")

            password_field = driver.find_element(id: "user-password")
            password_field.send_keys("password")

            submit_button = driver.find_element(id: "submit")
            submit_button.click

            # Confirm user is signed up succesfully

            banner = driver.find_element(id: "flash_success")
            banner_text = banner_text
            expect(banner_text).to eq("Welcome to the alpha blog user #{timestamp}")

            driver.quit
        end
    end
end