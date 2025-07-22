# 🏥 Health Care Domain – SQL Database Project

A comprehensive **SQL-based healthcare database** simulating real-world hospital operations such as appointments, treatments, staff assignments, patient data, room allocation, and prescriptions.

> 🔍 Ideal for data analysis, SQL query practice, and academic projects.

---

## 📁 Project Overview

This project builds a **relational database** for a tech-enabled hospital system. It covers all essential aspects of a hospital, allowing users to query for:

- Active appointments and room usage
- Physician-nurse-patient relationships
- Treatment history and certification tracking
- Medication prescriptions
- Departmental affiliations

---

## 🧱 Database Schema

The project includes the following tables:

| Table Name      | Description                                      |
|-----------------|--------------------------------------------------|
| `Patient`       | Contains patient details and assigned doctors    |
| `Physician`     | Details of hospital doctors and specialists      |
| `Nurse`         | Nurse records including on-call duty             |
| `Appointment`   | Appointment logs between doctors and patients    |
| `Department`    | Various medical departments                      |
| `Procedures`    | Available medical procedures and their costs     |
| `Trained_In`    | Physician certifications for procedures          |
| `Room`          | Hospital room inventory                          |
| `Stay`          | Patient stays, including room allocation         |
| `Undergoes`     | Records of patients undergoing procedures        |
| `Affiliated_With` | Department-Physician relationships             |
| `Medication`    | Drugs and medicine brands                        |
| `Prescribes`    | Which physician prescribed which medicine        |
| `On_Call`       | Nurse assignments for floors and blocks          |
| `Block`         | Block-level location management                  |

---

## 🧪 Sample SQL Queries

Over **15 real-world SQL queries** have been added, including:

- Find unregistered nurses
- Count unique patients by physician
- Identify physicians with/without affiliations
- Query room availability
- List treatments by physicians

```sql
-- Example: Get all nurses who are not registered
SELECT *
FROM Nurse
WHERE registered = 'f';
