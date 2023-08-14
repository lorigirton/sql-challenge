-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/SvH2tu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)  NOT NULL,
    "dept_name" VARCHAR(30)  NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY(
		"dept_no"
	)
	);

CREATE TABLE "dept_emp" (
    "emp_no" VARCHAR(10)  NOT NULL ,
    "dept_no" VARCHAR(4)  NOT NULL ,
    PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)  NOT NULL ,
    "emp_no" VARCHAR(10)  NOT NULL ,
    PRIMARY KEY ("emp_no"),
	FOREIGN KEY ("dept_no") REFERENCES departments
);

SELECT * FROM dept_manager;
--DROP TABLE public.dept_manager;

CREATE TABLE "employees" (
    "emp_no" VARCHAR(10)  NOT NULL ,
    "emp_title" VARCHAR(5)  NOT NULL ,
    "birth_date" DATE  NOT NULL ,
    "first_name" VARCHAR(20)  NOT NULL ,
    "last_name" VARCHAR(30)  NOT NULL ,
    "sex" VARCHAR(1)  NOT NULL ,
    "hire_date" DATE  NOT NULL ,
    PRIMARY KEY (
        "emp_no"
    )
);

--DROP TABLE public.employees;

CREATE TABLE "salaries" (
    "emp_no" VARCHAR(10)  NOT NULL ,
    "salary" INT  NOT NULL ,
    PRIMARY KEY (
        "emp_no"
    )
);

SELECT * FROM salaries;

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)  NOT NULL ,
    "title" VARCHAR(20)  NOT NULL ,
    PRIMARY KEY (
        "title_id"
    )
);

