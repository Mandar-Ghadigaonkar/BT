Working of JAQL

JAQL follows a functional programming paradigm and processes JSON data through a series of transformations and operations.

**1. JSON Data Representation**

JAQL is designed to work with JSON, which stores data in a flexible key-value format. Example:

jaql> a = { name : "Scott", age : 42, children : \["Jake", "Sam"] }; jaql> a.name;

"Scott"

jaql> a.children\[0]; "Jake"

**2. Input/Output Operations in JAQL**

JAQL uses I/O adapters to read and write data across different sources like local files, HDFS, and URLs.

Examples:

\* Writing data to a CSV file:

jaql> \[1, 2, 3, 4, 5] -> write(del("test.csv")); jaql> read(del("test.csv"));

\[1, 2, 3, 4, 5]

\* Reading from Local Files and HDFS:

jaql> read(del("file:///home/user/test.csv")); // Local File

jaql> read(del("hdfs://localhost:9000/user/test.csv")); // HDFS File

\* Reading JSON Data from a URL: jaql> jaqlGet("file:///tmp/test.txt");







**3. Data Manipulation (Core Operators)**

JAQL provides a set of operators to transform and analyze data, similar to SQL.

\* Filtering Data

&#x20;  The filter operator is used to select specific elements based on conditions. jaql> data = \[1, 2, 3, 4, 5, 6, 7, 8, 9];

jaql> data -> filter each num (3 <= num <= 6); \[ 3, 4, 5, 6 ]

\* Transforming Data

&#x20;  The transform operator applies an expression to each element in an array. jaql> recs = \[ {a: 1, b: 4}, {a: 2, b: 5}, {a: -1, b: 4} ];

jaql> recs -> transform { sum: $.a + $.b }; \[ { sum: 5 }, { sum: 7 }, { sum: 3 } ]

\* Sorting Data

&#x20; The sort operator orders records based on a specified field. jaql> read(del("file:///path/to/people.txt")) -> sort by \[$.age asc];

\* Grouping Data

The group by operator categorizes data based on a key.

jaql> employees -> group by $.department into { "Department": key, "Employees": $ };

**4. Execution on Hadoop**

JAQL supports distributed processing using Hadoop MapReduce, making it ideal for large-scale data processing.

Queries are executed in parallel across clusters for better performance.

**5. Writing Processed Data**

JAQL allows saving transformed data back into different storage formats like JSON, CSV, and HDFS.

Example:

write(employees -> filter $.salary > 6000, hdfs("high\_salary\_employees.json"));.







