-- 插入 PolicyHolder 表的資料，並使用 NEWID() 作為 code 和 introducer_code 的值
INSERT INTO sample..PolicyHolder (code, name, registration_date, introducer_code)
VALUES
    ('A123456789','John', '2023-01-01', 'A123456780'),
    ('B112243345','David', '2023-01-02', 'A123456789'),
    ('C233445564','Mary', '2023-01-03', 'A123456789'),
    ('D123456789','Emma', '2023-01-04', 'A123456789'),
    ('E112233445','Alice', '2023-01-05', 'A123456789'),
    ('F233445564','Tom', '2023-01-06','A123456789'),
    ('G123456789','Michael', '2023-01-07', 'B112243345'),
    ('H112433445','Sophia', '2023-01-08', 'B112243345'),
    ('I233445564','Olivia', '2023-01-09', 'B112243345'),
    ('J123456789','Emily', '2023-01-10', 'B112243345');
	
-- 插入 PolicyHolder_BinaryTree 表的資料，並使用 code 的值作為 policyholder_code，並保持 left_child_id 和 right_child_id 不變
INSERT INTO sample..PolicyHolder_BinaryTree (policyholder_code, left_child_id, right_child_id)
VALUES
    ((SELECT code FROM PolicyHolder WHERE name = 'John'), 1, 2),
    ((SELECT code FROM PolicyHolder WHERE name = 'David'), 3, 4),
    ((SELECT code FROM PolicyHolder WHERE name = 'Mary'), 5, 6),
    ((SELECT code FROM PolicyHolder WHERE name = 'Emma'), 7, 8),
    ((SELECT code FROM PolicyHolder WHERE name = 'Alice'), 9, 10),
    ((SELECT code FROM PolicyHolder WHERE name = 'Tom'), 11, 12),
    ((SELECT code FROM PolicyHolder WHERE name = 'Michael'), 13, 14),
    ((SELECT code FROM PolicyHolder WHERE name = 'Sophia'), 15, 16),
    ((SELECT code FROM PolicyHolder WHERE name = 'Olivia'), 17, 18),
    ((SELECT code FROM PolicyHolder WHERE name = 'Emily'), 19, 20);