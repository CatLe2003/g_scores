# G-Scores - Golden Owl SE Intern Test - 2025

A web application to manage, search, and analyze student scores from the 2024 Vietnamese national high school exam (`diem_thi_thpt_2024.csv`).

Video Demontrastion: https://youtu.be/NFnhQore9hg


## Features

*** Data Import & Storage**

  * Raw CSV data (`diem_thi_thpt_2024.csv`) is parsed and stored into a PostgreSQL database.
  * Implemented using a combination of **Rails migrations** and **seeds** (`db/seeds.rb`).

*** Search Student by Registration Number**

  * Users can input a registration number to check a student’s detailed subject scores.
  * Graceful handling of invalid or missing student records.

*** Score Level Report by Subject**

  * Report divides student scores into 4 levels:

    * **Above 8**
    * **6 to 7.99**
    * **4 to 5.99**
    * **Below 4**
  * The number of students per level per subject is displayed via charts using **Chartkick** + **Groupdate**.

*** Top 10 Students (Group A: Math, Physics, Chemistry)**

  * Displays top 10 students ranked by total score in Group A subjects.
  * Handled directly through ActiveRecord SQL aggregation.

***Responsive UI**: Built with TailwindCSS. Compatible with desktop, tablet, and mobile.
***Frontend Styling**: Clean interface styled using Tailwind and partials in ERB views.

##  Tech Stack

### Frontend

* HTML, ERB
* TailwindCSS
* Chartkick + Google Charts

### Backend

* Ruby on Rails 8
* PostgreSQL
* ActiveRecord (ORM)
* OOP structure: subject management logic is modularized and scalable.

### Dev Tools

* Rails Console for data debugging
* Rails seeds and migration for data setup
* Better Errors, Pry for debugging

##  Setup Instructions

### Requirements

* Ruby >= 3.1
* Rails >= 7.0
* PostgreSQL
* Node.js & Yarn (for JS dependencies)

### Setup Steps

# Install dependencies
bundle install
yarn install

# Setup DB
rails db:create
rails db:migrate
rails db:seed  # Imports data from CSV

# Start server
rails server

##  Validations & Security

* Input validation for registration number (numeric only, required).
* Uses parameterized queries (`find_by`) to avoid SQL Injection.
* Logic is guarded against `nil` values to prevent runtime errors.


## Author

* Built by **Le Ngo Song Cat**

