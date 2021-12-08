/*1st query*/

SELECT Student.FirstName,
         Student.LastName,
         COUNT(Student.StudentId) AS count
FROM Student
INNER JOIN Exams
    ON Student.StudentId = Exams.StudentId
WHERE Exams.result < 3
GROUP BY  Student.StudentId
HAVING count >=2;

/* 2nd query */


SELECT groups.name_group
FROM groups
JOIN 
    (SELECT Student.code_group
    FROM Student
    INNER JOIN Exams
        ON Student.StudentId = Exams.StudentId
    WHERE Exams.Result < 3
    GROUP BY  Student.StudentId
    HAVING count >=2) AS S
    ON groups.code_group=S.code_group
GROUP BY  groups.Name_Group
HAVING count(groups.Name_Group)>10