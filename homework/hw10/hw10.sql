CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-- SELECT name FROM pizzas WHERE open < 13 ORDER BY name DESC;
-- SELECT name, MAX(14 - open, 0) AS duration FROM pizzas ORDER BY duration DESC;
-- SELECT name || " closes at " || close AS status FROM pizzas, meals WHERE meals.meal = "snack" AND pizzas.close >= meals.time;
-- SELECT a.meal AS first, b.meal AS second, pizzas.name FROM meals AS a, meals AS b, pizzas WHERE a.time < b.time AND b.time - a.time > 6 AND pizzas.open <= a.time AND pizzas.close >= b.time;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.name FROM dogs as a, dogs as b, parents WHERE a.name = child AND b.name = parent ORDER BY b.height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE height > min AND height <= max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child as first, b.child as second FROM parents as a, parents as b WHERE a.parent = b.parent AND a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, "|| first || " and " || second || ", have the same size: " || a.size AS sentence FROM siblings, size_of_dogs as a, size_of_dogs as b WHERE a.name = first AND b.name = second AND a.size = b.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) as heightDiff from dogs GROUP BY fur having avg(height)*0.7 <= min(height) and avg(height)*1.3 >= max(height);

