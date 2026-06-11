
# Netflix Data Analysis Using SQL
[Netflix Logo](https://images.ctfassets.net/y2ske730sjqp/1aONibCke6niZhgPxuiilC/2c401b05a07288746ddf3bd3943fbc76/BrandAssets_Logos_01-Wordmark.jpg?w=940)
## Project Overview

This project analyzes the Netflix Titles dataset using PostgreSQL. The objective is to solve real-world business questions related to Netflix content by applying SQL concepts such as filtering, aggregation, window functions, string manipulation, date functions, subqueries, Common Table Expressions (CTEs), and data transformation techniques.

The project demonstrates practical SQL skills commonly used in data analytics and business intelligence roles.

---

## Dataset

The dataset contains information about Netflix Movies and TV Shows, including:

* Show ID
* Type (Movie / TV Show)
* Title
* Director
* Cast
* Country
* Date Added
* Release Year
* Rating
* Duration
* Genre
* Description

---

## Database Schema

A custom PostgreSQL table was created with appropriate data types for all columns.

```sql
CREATE TABLE netflix (
    show_id VARCHAR(6),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(208),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);
```

---

## SQL Concepts Used

### Data Exploration

* COUNT()
* DISTINCT
* Filtering using WHERE

### Aggregation

* GROUP BY
* ORDER BY
* LIMIT

### Window Functions

* RANK()
* PARTITION BY
* OVER()

### String Functions

* SPLIT_PART()
* STRING_TO_ARRAY()
* UNNEST()

### Date Functions

* TO_DATE()
* EXTRACT()
* CURRENT_DATE
* INTERVAL

### Conditional Logic

* CASE WHEN

### Pattern Matching

* LIKE
* ILIKE

### Advanced SQL

* Subqueries
* Common Table Expressions (CTEs)
* Type Casting using CAST() and `::numeric`

---

## Business Problems Solved

### 1. Count Movies vs TV Shows

Calculated the total number of Movies and TV Shows available on Netflix.

### 2. Most Common Rating by Content Type

Used window functions to determine the most frequently occurring rating for Movies and TV Shows.

### 3. Movies Released in 2020

Filtered all movies released in a specific year.

### 4. Top 5 Countries with Most Content

Split multi-country entries and identified countries contributing the highest number of titles.

### 5. Longest Movie

Found the movie with the maximum duration.

### 6. Content Added in the Last 5 Years

Used date conversion and interval calculations to retrieve recently added content.

### 7. Content by Director

Retrieved all Movies and TV Shows directed by Rajiv Chilaka.

### 8. TV Shows with More Than 5 Seasons

Extracted season counts from text and filtered long-running TV shows.

### 9. Content Count by Genre

Separated multiple genres and calculated content distribution across genres.

### 10. Year-wise Content Analysis for India

Analyzed yearly additions of Indian content and calculated each year's contribution percentage.

### 11. Documentary Movies

Identified content categorized under documentaries.

### 12. Missing Director Information

Retrieved records where director information was unavailable.

### 13. Salman Khan Appearances in Last 10 Years

Analyzed actor appearances based on cast information and release year.

### 14. Top 10 Actors in Indian Productions

Identified actors with the highest number of appearances in Indian Netflix content.

### 15. Content Classification Using Description

Categorized content as:

* Good Content
* Bad Content

based on the presence of keywords such as "kill" and "violence" using CASE statements and CTEs.

---

## Key Learnings

Through this project, I gained hands-on experience with:

* Data cleaning and transformation in SQL
* Working with string-based datasets
* Converting text into dates for analysis
* Window functions and ranking techniques
* Handling multi-valued columns using UNNEST()
* Writing business-oriented analytical queries
* Using CTEs and subqueries for complex logic

---

## Tools Used

* PostgreSQL
* SQL
* Netflix Titles Dataset
* GitHub

---

## Repository Structure

```text
Netflix-SQL-Project/
│
├── netflix_project.sql
├── dataset/
│   └── netflix_titles.csv
├── README.md
│
└── screenshots/
    └── query_results.png
```

---

## Project Outcome

This project demonstrates practical SQL problem-solving skills by answering real-world business questions using a publicly available Netflix dataset. It showcases proficiency in data exploration, transformation, aggregation, window functions, and analytical query writing using PostgreSQL.

---

### Author

**Pranava Samhitha Varayuru**
Aspiring Data Analyst | SQL | Python | Power BI | Excel



