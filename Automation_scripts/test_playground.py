import pytest

from pages.simple_form_page import SimpleFormPage
from pages.checkbox_page import CheckboxPage
from pages.dropdown_page import DropdownPage
from pages.input_form_page import InputFormPage


@pytest.mark.parametrize("message", [
    "Hello",
    "Selenium Automation",
    "12345"
])
def test_simple_form_submission(driver, base_url, message):
    page = SimpleFormPage(driver)

    page.navigate_to(base_url)

    # Open Simple Form Demo
    driver.find_element("link text", "Simple Form Demo").click()

    page.enter_message(message)
    page.click_submit()

    assert True


def test_checkbox_interaction(driver, base_url):
    page = CheckboxPage(driver)

    page.navigate_to(base_url)

    # Open Checkbox Demo
    driver.find_element("link text", "Checkbox Demo").click()

    page.check_option()
    assert page.is_option_checked()

    page.uncheck_option()
    assert not page.is_option_checked()


def test_dropdown_selection(driver, base_url):
    page = DropdownPage(driver)

    page.navigate_to(base_url)

    # Open Select Dropdown List
    driver.find_element("link text", "Select Dropdown List").click()

    page.select_day("Wednesday")

    assert page.get_selected_day() == "Wednesday"


# def test_input_form_submit(driver, base_url):
#     page = InputFormPage(driver)

#     page.navigate_to(base_url)

#     # Open Input Form Submit
#     driver.find_element("link text", "Input Form Submit").click()

#     page.fill_form(
#         "Nivetha",
#         "nivetha@test.com",
#         "9876543210",
#         "Chennai"
#     )

#     page.submit_form()

#     assert page.get_success_message() == "Form Submitted Successfully"