CREATE TABLE Продукты (
    id INT PRIMARY KEY,
    название VARCHAR(100),
    цена DECIMAL(10, 2),
    категория_id INT
);

CREATE TABLE Категории (
    id INT PRIMARY KEY,
    название VARCHAR(50)
);

INSERT INTO Категории (id, название)
VALUES
    (1, 'molochnaya productciya'),
    (2, 'ovoshi'),
    (3, 'bitovaya himiya'),
    (4, 'zhidkosti'),
	(5, 'prochee');
  

INSERT INTO Продукты (id, название, цена, категория_id)
VALUES
    (1, 'moloko', 2.50, 1),
    (2, 'sir', 4.75, 1),
    (3, 'yayca', 1.85, 5),
    (4, 'pomidori', 1.20, 2),
    (5, 'ogurci', 0.95, 2),
    (6, 'milo', 2.15, 3),
    (7, 'zhidkoe milo', 3.50, 3);
    
CREATE TABLE ПродуктыКатегории (
    продукт_id INT,
    категория_id INT,
    PRIMARY KEY (продукт_id, категория_id),
    FOREIGN KEY (продукт_id) REFERENCES Продукты (id),
    FOREIGN KEY (категория_id) REFERENCES Категории (id)
);

INSERT INTO ПродуктыКатегории (продукт_id, категория_id)
VALUES
    (1, 1),
    (1, 4),
    (2, 1),
    (3, 5),
    (4, 2),
    (5, 2),
    (6, 3),
    (7, 3),
    (7, 4);
    
SELECT Продукты.название AS Имя_продукта, Категории.название AS Имя_категории
FROM Продукты
LEFT JOIN ПродуктыКатегории ON Продукты.id = ПродуктыКатегории.продукт_id
LEFT JOIN Категории ON ПродуктыКатегории.категория_id = Категории.id;