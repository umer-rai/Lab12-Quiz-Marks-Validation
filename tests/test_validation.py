import os
import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

BASE_URL = os.getenv("APP_URL", "http://localhost:8080/Default.aspx")

TEST_CASES = [
    ("-1", "Rejected"),
    ("0", "Accepted"),
    ("5", "Accepted"),
    ("10", "Accepted"),
    ("11", "Rejected"),
]

class QuizMarksValidationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Selenium Manager (included with modern Selenium) can manage the browser driver.
        cls.driver = webdriver.Chrome()
        cls.wait = WebDriverWait(cls.driver, 10)
    
    
    def test_five_required_mark_values(self):
        self.driver.get(BASE_URL)
        failures = []

        print("\n--- Quiz marks validation results ---")

        for marks, expected in TEST_CASES:
            # Wait until the page is ready after any postback.
            self.wait.until(
                lambda driver: driver.execute_script(
                    "return document.readyState"
                ) == "complete"
            )

            # Always locate a fresh textbox.
            field = self.wait.until(
                EC.element_to_be_clickable((By.ID, "txtMarks"))
            )

            field.clear()
            field.send_keys(marks)

            # Remember the current textbox before submitting.
            old_field = field

            self.driver.find_element(By.ID, "btnValidate").click()

            # Wait for ASP.NET Web Forms to replace the old textbox.
            self.wait.until(EC.staleness_of(old_field))

            result = self.wait.until(
                EC.visibility_of_element_located((By.ID, "lblResult"))
            ).text

            actual = "Accepted" if result.startswith("Accepted") else "Rejected"
            status = "PASS" if actual == expected else "FAIL"

            print(
                f"Input={marks} | Expected={expected} | "
                f"Actual={actual} | {status}"
            )

            if actual != expected:
                failures.append(f"Input {marks}: {result}")

        self.assertEqual(failures, [], "Some validation tests failed")


    @classmethod
    def tearDownClass(cls):
        if hasattr(cls, "driver"):
            cls.driver.quit()

   

if __name__ == "__main__":
    unittest.main(verbosity=2)
