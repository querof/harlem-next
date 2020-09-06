-- Example case create statement:
CREATE TABLE stock (
                       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       extra_data JSON
);

INSERT INTO stock (extra_data) VALUES
('{"name": "Apple", "total_price": 25, "details": {"quantity": 5, "discounted_price": 5}}'),
('{"name": "Orange", "total_price": 10, "details": {"quantity": 2, "old_price": 5}}'),
('{"name": "Nail", "total_price": 4, "details": {"quantity": 3, "order": 2}}');

-- Fill in the blanks in the following statement:
SELECT extra_data->>'$.name' AS name FROM stock WHERE extra_data->>'$.details.quantity' > 2;
