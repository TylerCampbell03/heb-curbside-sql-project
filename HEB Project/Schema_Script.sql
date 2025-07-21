CREATE SCHEMA heb_curbside;
CREATE TABLE customer (
	cust_id INT NOT null Primary Key,
    first_name CHAR(30),
    last_name CHAR(30)
    );
    
    CREATE TABLE product (
		product_id INT NOT null Primary Key,
        product_name CHAR(30),
        units_on_hand INT,
        sales_price DECIMAL(6,2)
        );
        
	CREATE TABLE personal_shopper (
		shopper_id INT NOT null Primary Key,
        shopper_first CHAR(30),
        shopper_last CHAR(30)
        );
        
	CREATE TABLE curbie (
		curbie_id INT NOT null Primary Key,
        curbie_first CHAR(30),
        curbie_last CHAR(30)
        );
        
	CREATE TABLE `order` (
		`order_id` INT NOT null Primary Key,
        `order_date` DATE,
        cust_id INT,
        curbie_id INT,
        Foreign Key (cust_id) references customer(cust_id),
        Foreign Key (curbie_id) references curbie(curbie_id)
        );
        
	CREATE TABLE`order_product` (
    `order_id` INT,
    product_id INT,
    quantity INT,
    Foreign Key (`order_id`) references `order`(`order_id`),
    Foreign Key (product_id) references product(product_id)
    );
    
CREATE TABLE order_personal_shopper (
	`order_id` INT,
    shopper_id INT,
    run_type CHAR(10),
    Foreign Key (`order_id`) references `order`(`order_id`),
    Foreign Key (shopper_id) references personal_shopper(shopper_id)
    );
    
CREATE TABLE `order_revenue` (
	`order_id` INT NOT null Primary Key,
    `order_price` DECIMAL(6,2),
    Foreign Key (`order_id`) references `order`(`order_id`)
    );
    
CREATE TABLE customer_survey (
	survey_id INT NOT null Primary Key,
    cust_id INT,
    one_to_five_rating INT,
    comments TEXT,
    Foreign Key (cust_id) references customer(cust_id)
    );
    
CREATE TABLE curbie_stats (
	curbie_id INT NOT null Primary Key,
    retrieval_time_avg DECIMAL(5,2),
    `orders_retrieved` INT,
    left_behinds INT,
    Foreign Key (curbie_id) references curbie(curbie_id)
    );
  
  CREATE TABLE shopper_stats (
	shopper_id INT NOT null Primary Key,
    `orders_shopped` INT,
    units_shopped INT,
    uph DECIMAL(5,2),
    subs_and_shorts INT,
    Foreign Key (shopper_id) references personal_shopper(shopper_id)
    );
    
CREATE TABLE labor (
	labor_id INT auto_increment NOT null Primary Key,
    `week` DATE,
    shopper_id INT,
    curbie_id INT,
    labor_hours DECIMAL(4,2),
    wages DECIMAL(7,2),
    Foreign Key (shopper_id) references personal_shopper(shopper_id),
    Foreign Key (curbie_id) references curbie(curbie_id)
    );

SELECT * FROM labor
ORDER BY week ASC;

SELECT
  DISTINCT l.week AS labor_date,
  WEEK(l.week, 1) AS week_number,
  YEAR(l.week) AS year
FROM labor l
ORDER BY l.week;




