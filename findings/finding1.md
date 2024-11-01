### Finding 1: SQL Injection in Customer Portal

**Severity:** Critical

**Description:**

An SQL Injection vulnerability exists in the login functionality of **portal.acmecorp.com**. An attacker can manipulate the SQL query to bypass authentication and access sensitive customer data.

**Evidence:**

- Payload used: `' OR '1'='1' --`
- Gained access to multiple customer accounts without valid credentials.
- Extracted data from the `users` table, including usernames and hashed passwords.

**Impact:**

- Unauthorized access to customer accounts.
- Potential for full database compromise.
- Violation of data protection regulations.

**Recommendation:**

- Implement prepared statements or parameterized queries.
- Validate and sanitize all user inputs.
- Conduct regular code reviews and security testing.

**References:**

- [OWASP SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)

**Screenshot:**

![sql](../images/sql_injection_evidence.png)
