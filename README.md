# 📚 Student Management System - OOAD Lab Project

## Project Overview
A web-based Student Management System built with **Spring Boot**, **Hibernate (JPA)**, and **MySQL** that performs basic CRUD operations with a clean MVC architecture.

## Architecture
- **Framework**: Spring Boot (MVC Architecture)
- **ORM**: Hibernate (JPA)
- **Database**: MySQL 8.0+
- **View Engine**: Thymeleaf
- **Build Tool**: Maven

## Project Structure
```
student-management-system/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/studentmanagement/
│   │   │       ├── StudentManagementApplication.java
│   │   │       ├── controller/
│   │   │       │   └── StudentController.java
│   │   │       ├── service/
│   │   │       │   └── StudentService.java
│   │   │       ├── repository/
│   │   │       │   └── StudentRepository.java
│   │   │       └── model/
│   │   │           └── Student.java
│   │   └── resources/
│   │       ├── application.properties
│   │       └── templates/
│   │           └── index.html
│   └── test/
├── pom.xml
├── database_setup.sql
└── README.md
```

## Prerequisites
- Java JDK 11 or higher
- MySQL Server 8.0+
- Maven 3.6+
- IDE (IntelliJ IDEA, Eclipse, or VS Code)

## Setup Instructions

### Step 1: Database Setup
1. Open MySQL Command Line or MySQL Workbench
2. Run the following commands:

```mysql
-- Create database and user
CREATE DATABASE student_management_db;
```

Or execute the SQL script:
```bash
mysql -u root <passwd?> < database_setup.sql
```

### Step 2: Clone/Open the Project
1. Navigate to the project directory
2. Verify the project structure matches the layout above

### Step 3: Update application.properties (Already Done!)
The file is already configured with:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/student_management_db
spring.datasource.username=root
spring.datasource.password=sathwik
```

### Step 4: Build the Project
```bash
cd student-management-system
mvn clean install
```

### Step 5: Run the Application
```bash
mvn spring-boot:run
```

Or run via IDE:
1. Right-click on `StudentManagementApplication.java`
2. Select "Run As" → "Java Application"

### Step 6: Access the Application
Open your browser and navigate to:
```
http://localhost:8080/
```

## Features Implemented ✅

### 1. Model (Student.java)
- ✅ Auto-generated ID
- ✅ Name field
- ✅ Email field (unique)
- ✅ Course field
- ✅ Getters and Setters

### 2. Repository (StudentRepository.java)
- ✅ CRUD operations via JpaRepository
- ✅ findByEmail() - for duplicate email validation
- ✅ findByCourse() - retrieve students by course

### 3. Service Layer (StudentService.java)
- ✅ addStudent() - Create new student
- ✅ getAllStudents() - Read all students
- ✅ getStudentById() - Read specific student
- ✅ getStudentsByCourse() - Retrieve by course
- ✅ Duplicate email validation

### 4. Controller (StudentController.java)
- ✅ GET / - Display home page with student list
- ✅ POST /students - Handle form submission
- ✅ GET /api/students - REST API for all students
- ✅ POST /api/students - REST API for creating students
- ✅ Input validation
- ✅ Error handling with flash messages

### 5. View (index.html)
- ✅ Responsive design with gradient background
- ✅ Student registration form (Name, Email, Course)
- ✅ Form validation (required fields)
- ✅ Success/error message display
- ✅ Student list table (ID, Name, Email, Course)
- ✅ Dynamic table updates
- ✅ Professional styling with CSS

## API Endpoints

### Web Form Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | / | Display home page with form and student list |
| POST | /students | Submit new student (form data) |

### REST API Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/students | Fetch all students (JSON) |
| POST | /api/students | Create new student (JSON) |

## Expected Functional Behavior

### ✅ Student Can Be Added
1. User fills the registration form with Name, Email, Course
2. Clicks Submit button
3. Data is validated and stored in database
4. Page redirects to home page
5. Success message is displayed
6. New student appears in the list immediately

### ✅ Student List Can Be Viewed
1. Page loads with all students from database
2. Table displays ID, Name, Email, Course
3. Table updates automatically after adding new student
4. Empty message shown if no students exist

### ✅ Duplicate Email Not Allowed
1. Attempting to register with existing email shows error
2. Original record remains unchanged
3. User is redirected to form to correct the email

### ✅ Data Persists in Database
1. All students are stored in MySQL database
2. Data survives application restart
3. Retrieved from `student` table

### ✅ MVC Structure Properly Followed
- **Model**: Student.java with JPA annotations
- **View**: index.html with Thymeleaf templates
- **Controller**: StudentController handling HTTP requests
- **Service**: StudentService with business logic
- **Repository**: StudentRepository for database operations

## Database Schema

```sql
CREATE TABLE student (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    course VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Testing the Application

### Add a Student
1. Navigate to http://localhost:8080/
2. Fill in the form:
   - Name: John Doe
   - Email: john@example.com
   - Course: Java
3. Click Submit
4. Verify student appears in the table

### Test Duplicate Email Validation
1. Try to add a student with an existing email
2. Should see error message: "Email already exists"
3. Original student list should remain unchanged

### View Student List
1. Students table displays all registered students
2. Each row shows ID, Name, Email, Course
3. Data is fetched from MySQL database

## Troubleshooting

### MySQL Connection Error
- Ensure MySQL is running
- Verify credentials: username=root, password=sathwik
- Check if database `student_management_db` exists

### Port 8080 Already in Use
- Change port in application.properties: `server.port=8081`

### Build Errors
```bash
# Clean and rebuild
mvn clean
mvn install
```

## Dependencies (pom.xml)
```xml
- spring-boot-starter-web
- spring-boot-starter-data-jpa
- spring-boot-starter-thymeleaf
- mysql-connector-j (MySQL driver)
```

## Notes
- Hibernate is configured to auto-create and update tables
- JPA annotations are used throughout for clean code
- Thymeleaf is used for server-side template rendering
- Form submission uses Thymeleaf model binding

## Author
OOAD Lab - Student Management System

## Submission Checklist
- ✅ All CRUD operations implemented
- ✅ MVC architecture followed
- ✅ Database persistence confirmed
- ✅ Duplicate email validation working
- ✅ Responsive UI with styling
- ✅ Error handling and messages
- ✅ REST API endpoints working
- ✅ Documentation complete
