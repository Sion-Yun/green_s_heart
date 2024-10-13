# Green_S_Heart

## Project Overview
This Flutter project is for the management of medications, providing a user-friendly interface.
A login screen for user authentication with input validations and a home screen for the list of medications are featured.
This project implements a object-oriented programming concepts for the code's readability and maintainability.

## Design Choices

### UI/UX
1. Login Screen 
    - Includes fields for email and password. 
    - Snack bars and loading indicators are added for feedback mechanisms.
2. Home Screen
    - Displays medications with a clear card format to enhance readability.
    - Scrollable to display more cards if the list of cards exceeds the screen.
3. Navigation System
    - A simple navigation system is implemented with Navigator widget.
4. Responsive UI
    - From widgets and layouts that are adaptive to various screen sizes.

### OOP
1. Medication class encapsulates medication's properties.
2. MedicationManager class manages operations related to medications, promoting separation of concerns.
3. Inheritance - PrescriptionMedication extends Medication, with an extra property (doctorName), demonstrating polymorphism.
4. Encapsulation - The medication list is kept private, to ensure data integrity.

### Assumptions
1. Long term persistence of the user data is not required.
2. Basic input validation is implemented for user login and medication management.
   - The user database is not yet implemented. 
   - Sample user data is stored at /data/medications.json
3. This project is extensible for future changes, including modifications in UI/UX.


