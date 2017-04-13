require_relative "spec_helper"

describe "Guinea Pig" do
  it "verify link opens page with correct title" do
    @driver.find_element(id: 'i_am_a_link').click

    expect { @driver.find_element(id: 'i_am_a_link') }.to raise_error Selenium::WebDriver::Error::NoSuchElementError
  end

  it "should enter a comment" do
    text = "This is a comment"
    @driver.find_element(id: 'comments').click
    @driver.find_element(id: 'comments').send_keys text

    last_element = @driver.find_elements(xpath: '//*').last
    Appium::TouchAction.new.tap(element: last_element).perform

    @driver.find_element(id: 'submit').click

    Selenium::WebDriver::Wait.new.until { @driver.find_element(id: 'your_comments') }
    comment = @driver.find_element(id: 'your_comments').text

    expect(comment).to eq text
  end
end
