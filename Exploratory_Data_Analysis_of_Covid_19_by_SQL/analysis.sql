--create covid date  table for using the csv

CREATE TABLE covid (
    continent   VARCHAR(42),
    location    VARCHAR(45),
    entiry_date DATE,
    population  INT,
    infected    INT,
    dead        INT,
    vaccinated  INT
);

select count(*) from covid;

desc covid;

select count(*) from covid HAVING count(*)>1;

-- Shows likelihood of a person would be died in case of she has been infected?

SELECT
    continent,
    SUM(dead)     AS dead,
    SUM(infected) AS infected,
    round((SUM(dead) / SUM(infected)) * 100,
          2)      AS infeacted_dead
FROM
    covid
GROUP BY
    continent;



-- Shows likelihood of a person would be died in case of she has been vaccinated?
SELECT
    location,
    SUM(dead),
    SUM(vaccinated),
    round((SUM(dead) / SUM(vaccinated) * 100),
          2) AS dead_vaccinated
FROM
    covid
GROUP BY
    location;

-- Shows likelihood of a person would be infected in case of she has been vaccinated?
SELECT
    location,
    SUM(infected),
    SUM(vaccinated),
    round(( SUM(infected) / SUM(vaccinated) * 100 ),2) AS infected_vaccinated
FROM
    covid
GROUP BY
    location;

-- Which country does have the highest death rate compare to population?
SELECT
    location,
    population,
    SUM(dead),
    round((SUM(dead) / population * 100 ),2) AS highestrate
FROM
    covid

GROUP BY
    location,
    population
ORDER BY
    highestrate DESC;