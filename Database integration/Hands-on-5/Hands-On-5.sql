// Hands-On 5 - MongoDB CRUD Operations
// Scenario: Student Course Registration System

use("college_db");

// Create Collection
db.createCollection("students");

// Insert One Document
db.students.insertOne({
  student_id: 1,
  first_name: "Arjun",
  last_name: "Mehta",
  email: "arjun.mehta@college.edu",
  department: "Computer Science",
  enrollment_year: 2022
});

// Insert Multiple Documents
db.students.insertMany([
  {
    student_id: 2,
    first_name: "Priya",
    last_name: "Suresh",
    email: "priya.suresh@college.edu",
    department: "Computer Science",
    enrollment_year: 2022
  },
  {
    student_id: 3,
    first_name: "Rohan",
    last_name: "Verma",
    email: "rohan.verma@college.edu",
    department: "Electronics",
    enrollment_year: 2021
  },
  {
    student_id: 4,
    first_name: "Sneha",
    last_name: "Patel",
    email: "sneha.patel@college.edu",
    department: "Mechanical",
    enrollment_year: 2023
  }
]);

// Read All Documents
db.students.find().pretty();

// Find Students by Enrollment Year
db.students.find({
  enrollment_year: 2022
});

// Update One Document
db.students.updateOne(
  { first_name: "Priya" },
  { $set: { department: "AI & DS" } }
);

// Verify Updated Document
db.students.find({
  first_name: "Priya"
});

// Delete One Document
db.students.deleteOne({
  first_name: "Sneha"
});

// Verify Remaining Documents
db.students.find().pretty();

// Count Total Documents
db.students.countDocuments();

// Aggregation Pipeline - Count by Department
db.students.aggregate([
  {
    $group: {
      _id: "$department",
      total_students: { $sum: 1 }
    }
  }
]);
