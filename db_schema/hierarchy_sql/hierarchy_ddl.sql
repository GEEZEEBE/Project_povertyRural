SELECT @myRight := rgt FROM nested_category
WHERE name LIKE 'ELECTRONICS%';

UPDATE nested_category SET rgt = rgt + 2 WHERE rgt > @myRight;
UPDATE nested_category SET lft = lft + 2 WHERE lft > @myRight;
INSERT INTO nested_category(name, lft, rgt) VALUES('TUBE_SUB', @myRight + 1, @myRight + 2);

UPDATE nested_category SET rgt = rgt + 2 WHERE rgt > 24;
UPDATE nested_category SET lft = lft + 2 WHERE lft > 24;
INSERT INTO nested_category(name, lft, rgt) VALUES('electronic', 24 + 1, 24 + 2);

--------------------------------------------------------------------------------------------------------
SELECT @myLeft := lft, lft FROM nested_category
WHERE name = 'FRS';

UPDATE nested_category SET rgt = rgt + 2 WHERE rgt > @myLeft;
UPDATE nested_category SET lft = lft + 2 WHERE lft > @myLeft;
INSERT INTO nested_category(name, lft, rgt) VALUES('FRS', @myLeft + 1, @myLeft + 2);

UPDATE nested_category SET rgt = rgt + 2 WHERE rgt > 4;
UPDATE nested_category SET lft = lft + 2 WHERE lft > 4;
INSERT INTO nested_category(name, lft, rgt) VALUES('FRS_sub', 4 + 1, 4 + 2);

---------------------------------------------------------------------------------------
SELECT @myLeft := lft, @myRight := rgt, @myWidth := rgt - lft + 1
FROM nested_category
WHERE name = 'TUBE_SUB';

DELETE FROM nested_category WHERE lft BETWEEN @myLeft AND @myRight;
UPDATE nested_category SET rgt = rgt - @myWidth WHERE rgt > @myRight;
UPDATE nested_category SET lft = lft - @myWidth WHERE lft > @myRight;

DELETE FROM nested_category WHERE lft BETWEEN 5 AND 8;
UPDATE nested_category SET rgt = rgt - 4 WHERE rgt > 8;
UPDATE nested_category SET lft = lft - 4 WHERE lft > 8;
