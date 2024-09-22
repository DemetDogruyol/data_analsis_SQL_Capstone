## SQL Database Project

This project contains a SQL database schema based on an Entity-Relationship Diagram (ERD) visualized for managing business data like customers, orders, products, suppliers, and employees. The project includes SQL queries for data retrieval, insertion, and manipulation using this schema.

### Project Overview

The database represents a relational structure for managing:

- **Customers**: Contains customer details such as contact information, addresses, and regions.
- **Orders**: Handles customer orders, including order dates, shipping details, and order statuses.
- **Products**: Details about available products, categories, prices, and suppliers.
- **Suppliers**: Information about suppliers including their contact and location details.
- **Employees**: Employee data such as names, roles, and regions they manage.
- **Shippers**: Companies responsible for shipping orders.
- **Territories**: Geographic areas managed by employees.
- **Customer demographics**: Detailed information on customer types.
  
The database is structured using PostgreSQL conventions, with appropriate foreign key relationships, to ensure data integrity and efficient queries.

### ER Diagram

The diagram visualizes the relationships between different tables:

- **Customers & Orders**: Customers can have multiple orders.
- **Orders & OrderDetails**: Each order can contain multiple products.
- **Products & Suppliers**: Products are supplied by different suppliers.
- **Employees & Territories**: Employees manage specific geographic regions.
- **Shippers**: Responsible for fulfilling customer orders.
  
Here’s a breakdown of the main tables:

1. **Customers**:
    - Fields: `customerid`, `companyname`, `contactname`, `city`, `country`
    - Relations: Linked to `Orders`

2. **Orders**:
    - Fields: `orderid`, `customerid`, `employeeid`, `orderdate`, `requireddate`, `shippeddate`
    - Relations: Connected to `Customers`, `Shippers`, `Employees`, `OrderDetails`

3. **OrderDetails**:
    - Fields: `orderid`, `productid`, `unitprice`, `quantity`, `discount`
    - Relations: Connected to `Orders` and `Products`

4. **Products**:
    - Fields: `productid`, `productname`, `supplierid`, `categoryid`, `unitprice`, `unitsinstock`
    - Relations: Linked to `OrderDetails`, `Suppliers`

5. **Employees**:
    - Fields: `employeeid`, `lastname`, `firstname`, `title`, `birthdate`, `hiredate`
    - Relations: Connected to `Orders` and `Territories`

6. **Shippers**:
    - Fields: `shipperid`, `companyname`, `phone`
    - Relations: Connected to `Orders`

### Technologies Used

- **PostgreSQL**: Database management system
- **SQL**: Queries for CRUD (Create, Read, Update, Delete) operations
- **Diagram Tool**: ER diagram created with a tool for better visualization

### Installation & Setup

1. Clone this repository:
    ```bash
    git clone https://github.com/yourusername/sql-database-project.git
    ```

2. Set up PostgreSQL:
    - Install PostgreSQL from the [official site](https://www.postgresql.org/download/).
    - Create a new database in PostgreSQL:
    ```sql
    CREATE DATABASE your_database_name;
    ```

3. Import the database schema:
    ```bash
    psql -U username -d your_database_name -f database_schema.sql
    ```

4. Run SQL queries to populate data and perform operations.

### Usage

- Execute basic SQL queries such as:
    ```sql
    SELECT * FROM customers;
    ```

- Query data based on relationships:
    ```sql
    SELECT o.orderid, c.companyname, p.productname, od.quantity
    FROM orders o
    JOIN customers c ON o.customerid = c.customerid
    JOIN orderdetails od ON o.orderid = od.orderid
    JOIN products p ON od.productid = p.productid;
    ```

### Contributing

Feel free to open issues or pull requests if you want to contribute to this project.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
