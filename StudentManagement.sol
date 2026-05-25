// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentManagement {

    // Structure to store student details
    struct Student {
        uint id;
        string name;
        uint age;
        string department;
    }

    // Mapping to store students using ID as key
    mapping(uint => Student) private students;

    // Mapping to check whether a student already exists
    mapping(uint => bool) private studentExists;

    // Function to add a new student
    function addStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {

        // Prevent duplicate student IDs
        require(!studentExists[_id], "Student ID already exists");

        // Add student to mapping
        students[_id] = Student(
            _id,
            _name,
            _age,
            _department
        );

        // Mark student as existing
        studentExists[_id] = true;
    }

    // Function to update existing student data
    function updateStudent(
        uint _id,
        string memory _name,
        uint _age,
        string memory _department
    ) public {

        // Check if student exists before updating
        require(studentExists[_id], "Student does not exist");

        // Update student information
        students[_id] = Student(
            _id,
            _name,
            _age,
            _department
        );
    }

    // Function to get student details
    function getStudent(uint _id)
        public
        view
        returns (
            uint,
            string memory,
            uint,
            string memory
        )
    {

        // Check if student exists
        require(studentExists[_id], "Student does not exist");

        Student memory s = students[_id];

        return (
            s.id,
            s.name,
            s.age,
            s.department
        );
    }
}