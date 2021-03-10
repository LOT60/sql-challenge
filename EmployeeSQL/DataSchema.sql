DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS title;


CREATE TABLE departments (
  dept_no character varying NOT NULL,
  dept_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no VARCHAR(50) NOT NULL
);

CREATE TABLE dept_manager (
  dept_no character varying(50) NOT NULL,
  emp_no integer NOT NULL
);

CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title_id character varying(50) NOT NULL,
    birth_date date DEFAULT now() NOT NULL,
	first_name character varying NOT NULL,
	last_name character varying NOT NULL,
	sex character varying NOT NULL,
    hire_date date NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL,
  PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
  title_id VARCHAR(50) NOT NULL,
  title VARCHAR(50) NOT NULL,
  PRIMARY KEY (title_id)
);
