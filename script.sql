CREATE TABLE `task` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Task_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `employee_code` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE PROCEDURE task_manager.usp_employee_add_or_edit(IN _id INT, IN _name varchar(45), IN _employee_code varchar(30), IN _salary INT)
BEGIN
    IF _id = 0 THEN
    INSERT INTO employee(name,employee_code,salary) VALUES(_name, _employee_code, _salary);
    ELSE
    UPDATE employee SET
			name = _name,
			employee_code = _employee_code,
        	salary = _salary
        WHERE id = _id;
    SELECT ROW_COUNT() AS 'affectedRows';
   end if;
END

LOCK TABLES `task_manager`.`employee` WRITE;
INSERT INTO `task_manager`.`employee` VALUES 
(1,'An',0),
(2,'Ngu',1),
(3,'Choi game',0),
(4,'Sejuani',1);
UNLOCK TABLES;

LOCK TABLES `task_manager`.`task` WRITE;
INSERT INTO `task_manager`.`task` VALUES 
(1,'Thanh','GPMN1975',70000),
(2,'QBB','CMT8-1945',2500),
(3,'OrnnLyFans','EMP99',69000),
(4,'Sejuani','Qbb',6300);
UNLOCK TABLES;

CREATE PROCEDURE task_manager.usp_task_add_or_edit(IN _id INT, IN _Task_Name varchar(45), IN _Completed bool)
BEGIN
    IF _id = 0 THEN
    INSERT INTO task(Task_Name,Completed) VALUES(_Task_Name, _Completed);
    ELSE
    UPDATE task SET
			Task_Name = _Task_Name,
        	Completed  = _Completed
        WHERE id = _id;
    SELECT ROW_COUNT() AS 'affectedRowsTask';
   end if;
END

