# College Library Management System

This project is a web application designed to simplify and manage library operations within a college setting. Built using JSP, Servlets, and JDBC, with MySQL as the database, it facilitates key library functions such as book and user management, fine calculation, and user authentication. The system supports multiple libraries, where each library and its users have unique access and data, enhancing data security and usability.

## Features

- **Student Registration**: Register students and maintain their borrowing limits and other records.
- **Book Management**: Add, delete, update, and search books by author, title, or category.
- **Book Issuance and Fine Calculation**: Books can be issued to students for up to 15 days; overdue books incur a fine of 10 rupees per day.
- **Multi-Library Registration**: Each library can register independently, creating separate databases and managing unique user accounts.
- **Librarian Functionality**: Authorized librarians can manage books and issue them to students.
- **User Authentication**: Ensures students and librarians have secure, personalized access.

## Technologies Used

- **Frontend**: HTML, CSS, (basic UI for forms and pages).
- **Backend**: JSP, Servlet, JDBC.
- **Database**: MySQL for storing user, book, and transaction data.

## Installation

1. Clone this repository:
    ```bash
    git clone https://github.com/raviraj2-c/College-Library-Management.git
    ```
2. Import the project into your IDE (e.g., IntelliJ IDEA, Eclipse).
3. Set up the MySQL database and update the database configuration in the code.
4. Deploy on a local server (e.g., Apache Tomcat).

## Usage

1. **Library Registration**: Register a library; this creates a separate database for its records.
2. **Login**: Students and librarians can log in to access their respective features.
3. **Student & Book Management**: Perform CRUD operations on student and book records.
4. **Book Issuance and Fine Calculation**: Issue books and track due dates automatically.

## Project Structure

- `src/`: Contains all JSP and Servlet files.
- `lib/`: Required libraries for JDBC, etc.
- `database/`: SQL files for database setup.

## Future Enhancements

- Enhanced UI for better user experience.
- Fine-tuned search with additional filters.
- Expanded book return options and notifications.

## Contributors

- [Raviraj Kumar](https://github.com/raviraj2-c)

## License

This project is licensed under the MIT License.
