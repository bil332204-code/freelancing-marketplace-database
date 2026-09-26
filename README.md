# Freelancing Marketplace Database

A relational **MySQL database project** for a freelancing marketplace where clients place orders for freelancer gigs, payments are tracked, completed orders can be reviewed, and freelancer ratings can be updated automatically.

The project was developed for **CS-220 Database Systems at NUST SEECS**.

## Project Scope

The database models the main parts of a freelancing platform:

- Users and roles
- Separate freelancer and client profiles
- Freelancer skills through a many-to-many junction table
- Service categories and gigs
- Order lifecycle tracking
- Payments and payment status
- Reviews and ratings
- Analytical SQL queries

## Database Design

### Main Entities

- `Role`
- `User`
- `Freelancer`
- `Client`
- `Skill`
- `Freelancer_Skill`
- `Category`
- `Gig`
- `Order_Status`
- `Orders`
- `Payment_Status`
- `Payment`
- `Review`

### Key Relationships

- A `User` is associated with a role.
- Freelancer-specific and client-specific information is separated into dedicated tables.
- `Freelancer_Skill` resolves the many-to-many relationship between freelancers and skills.
- Each gig belongs to one freelancer and one category.
- Orders connect clients to gigs and use a separate status lookup table.
- Payments belong to orders and use a separate payment-status table.
- Reviews belong to orders rather than directly to freelancers.

A Mermaid ER overview based on the implemented schema is available in [`docs/SCHEMA.md`](docs/SCHEMA.md).

## SQL Features Demonstrated

### DDL & DML

The project includes:

- table creation
- primary and foreign keys
- `UNIQUE`, `NOT NULL`, `DEFAULT`, and `CHECK` constraints
- seed data using `INSERT`
- relational joins and filtering
- grouping, aggregation, subqueries, and `GROUP_CONCAT`

### Triggers

Two triggers are implemented:

1. **`update_rating`** — recalculates freelancer ratings after a new review is inserted.
2. **`check_review_before_insert`** — blocks a review unless its related order is completed.

### Stored Procedures

- **`PlaceOrder`** — inserts a new order with pending status.
- **`CompleteOrder`** — marks an order completed and updates its payment status.

### Indexes

Indexes are created for commonly searched or joined columns including user email, freelancer skill, gig category, client orders, payment status, and review order.

### View

`Order_Report` provides a combined order report containing client, freelancer, gig, status, and order date.

## Analytical Queries

The project includes practical SQL queries for freelancer revenue, order status counts, full order reporting, multi-skilled freelancers, pending payments, highest-order clients, above-average gig prices, freelancer ratings, total income, Python-skilled freelancers, and freelancer experience.

## Normalization

The project presentation documents analysis through **1NF, 2NF, 3NF, and BCNF**. The design separates repeated lookup data such as roles, order statuses, payment statuses, categories, and skills to reduce redundancy and improve consistency.

## My Contribution — Bilal Ahmed

My documented primary role was **DDL and DML**.

I worked on:

- creating tables and attributes
- defining primary keys, foreign keys, and constraints
- inserting and managing project data
- writing and debugging SQL
- working hands-on with the project triggers as part of implementation/integration

The project was collaborative, so features owned primarily by other team members are described as project-level features rather than claimed as individual work.

## Team

| Member | Primary documented role |
|---|---|
| **Bilal Ahmed** | DDL & DML; hands-on trigger work |
| **Usman Ahmed Ibrahim** | Problem identification & functional requirements |
| **Muhammad Riyan Khalid** | Database architecture & ER diagram |
| **Ali Muhammad Khan** | Functional dependencies & normalization analysis |
| **Usman Sami** | Procedures, triggers & query optimization analysis |

## How to Run

### Requirements

- MySQL 8.x recommended
- MySQL Workbench, command line client, or another MySQL-compatible SQL client

Open `sql/Freelancing_Marketplace.sql` and execute it from top to bottom.

The script creates the database and schema, inserts sample data, creates triggers and stored procedures, creates indexes and a view, and runs the analytical queries.

## Notes

This repository preserves the project SQL as implemented for the course. Some modeling choices are intentionally left in their academic-project form rather than silently rewritten as a production database.

### Possible Future Improvements

- use auto-incrementing surrogate keys where appropriate
- represent experience as a numeric value instead of text for reliable ordering
- add timestamps to more business events
- strengthen uniqueness/cardinality rules for one-to-one profile tables
- add transaction handling around multi-step stored procedures
- add automated SQL tests
- include benchmark evidence using `EXPLAIN` before/after indexing
- expand review history and reporting features

---

**Project:** Freelancing Marketplace Database  
**Course:** CS-220 Database Systems  
**Institution:** NUST SEECS  
**DBMS:** MySQL
