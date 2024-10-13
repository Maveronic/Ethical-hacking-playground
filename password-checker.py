import re


def is_strong_password(password):
    feedback = []

    try:
        # Check for minimum length
        if len(password) < 12:
            feedback.append("Password should be at least 12 characters.")

        # Check for uppercase, lowercase, numbers, and special characters
        if not re.search(r'[A-Z]', password):
            feedback.append("Include at least one uppercase letter.")
        if not re.search(r'[a-z]', password):
            feedback.append("Include at least one lowercase letter.")
        if not re.search(r'[0-9]', password):
            feedback.append("Include at least one number.")
        if not re.search(r'[!@#$%^&*(),.?":{}|<>]', password):
            feedback.append("Include at least one special character.")

        # Check for common patterns or sequences
        if re.search(r'123|abc|password', password, re.IGNORECASE):
            feedback.append("Avoid common patterns or sequences.")

        return feedback if feedback else True

    except Exception as e:
        return f"An error occurred: {e}"


try:
    # Get user input
    user_password = input("Enter your password: ")

    # Check password strength
    result = is_strong_password(user_password)

    if result is True:
        print("Strong password! Good job.")
    else:
        print("Weak password. Please make it stronger.")
        for feedback in result:
            print(f"- {feedback}")

except Exception as e:
    print(f"An unexpected error occurred: {e}")
