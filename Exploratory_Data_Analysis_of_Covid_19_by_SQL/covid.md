## Covid data analysis

- *1. Display the covid data*

```
SQL> select * from covid;

CONTINENT                                  LOCATION                                      ENTIRY_DA POPULATION   INFECTED       DEAD VACCINATED
------------------------------------------ --------------------------------------------- --------- ---------- ---------- ---------- ----------
Oceania                                    Australia                                     20-JAN-28   25499881          0          0          0
Oceania                                    Australia                                     20-JAN-31   25499881          0          0          0
Oceania                                    Australia                                     20-FEB-02   25499881          0          0          1
Oceania                                    Australia                                     20-FEB-03   25499881          0          0          2
Oceania                                    Australia                                     20-FEB-05   25499881          0          0          3
Oceania                                    Australia                                     20-FEB-08   25499881          0          0          4
Oceania                                    Australia                                     20-FEB-09   25499881          0          0          5
Oceania                                    Australia                                     20-FEB-10   25499881          0          0          6
Oceania                                    Australia                                     20-FEB-11   25499881          0          0          7
Oceania                                     Samoa                                        20-FEB-12   25499881          0          0          8
Oceania                                    Australia                                     20-FEB-13   25499881          0          1          9

CONTINENT                                  LOCATION                                      ENTIRY_DA POPULATION   INFECTED       DEAD VACCINATED
------------------------------------------ --------------------------------------------- --------- ---------- ---------- ---------- ----------
Oceania                                    Australia                                     20-FEB-14   25499881          0          2         10
Oceania                                    Papua New Guinea                              20-FEB-15   25499881          0          3         11
Oceania                                    Australia                                     20-FEB-16   25499881          0          4         12
Oceania                                    Australia                                     20-FEB-17   25499881          0          5         13
Oceania                                    Australia                                     20-FEB-18   25499881          0          6         14
Oceania                                    Australia                                     20-FEB-19   25499881          0          7         15
Oceania                                    Australia                                     20-FEB-20   25499881          0          8         16
Oceania                                    Australia                                     20-FEB-21   25499881          0          9         17
Oceania                                    Australia                                     20-FEB-22   25499881          0         10         18
Oceania                                    Australia                                     20-FEB-23   25499881          0         11         19
Oceania                                    Australia                                     20-FEB-24   25499881          0         12         20

```

- *2. Total No of  covid data*

```
SQL> select count(*) from covid;

  COUNT(*)
----------
      6346

```

- *3. Shows likelihood of a person would be died in case of she has been infected?*
```
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
```
```

CONTINENT                                        DEAD   INFECTED INFEACTED_DEAD
------------------------------------------ ---------- ---------- --------------
Oceania                                          1083      29811           3.63
North America                                  601418   33575337           1.79
South America                                  404075   14659011           2.76
Europe                                         348788   15857015            2.2
Asia                                           302750   22481889           1.35
```
- *4. Shows likelihood of a person would be died in case of she has been vaccinated?*

```
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
```
```
LOCATION                                       SUM(DEAD) SUM(VACCINATED) DEAD_VACCINATED
--------------------------------------------- ---------- --------------- ---------------
Brazil                                            404075        39021975            1.04
China                                               5350       184605186               0
United Kingdom                                    127775        46071768             .28
 Samoa                                                 0               8               0
France                                            107495        21519093              .5
Germany                                            85151        28750313              .3
India                                             213610       142586840             .15
United States                                     576232       227689829             .25
Australia                                           1080         2181871             .05
Papua New Guinea                                       3              11           27.27
Canada                                             25186        13421484             .19

LOCATION                                       SUM(DEAD) SUM(VACCINATED) DEAD_VACCINATED
--------------------------------------------- ---------- --------------- ---------------
Switzerland                                        10891         2432568             .45
Japan                                              10201         2508151             .41
Netherlands                                        17476          169032           10.34
South Korea                                         1831         3488544             .05
Iran                                               71758          204513           35.09
```
- 5.Shows likelihood of a person would be infected in case of she has been vaccinated?

```
SELECT
    location,
    SUM(infected),
    SUM(vaccinated),
    round(( SUM(infected) / SUM(vaccinated) * 100 ),2) AS infected_vaccinated
FROM
    covid
GROUP BY
    location;
```
```
LOCATION                                      SUM(INFECTED) SUM(VACCINATED) INFECTED_VACCINATED
--------------------------------------------- ------------- --------------- -------------------
Brazil                                             14659011        39021975               37.57
China                                                101948       184605186                 .06
United Kingdom                                      4441820        46071768                9.64
 Samoa                                                    0               8                   0
France                                              5826883        21519093               27.08
Germany                                             3405365        28750313               11.84
India                                              19164969       142586840               13.44
United States                                      32346970       227689829               14.21
Australia                                             29811         2181871                1.37
Papua New Guinea                                          0              11                   0
Canada                                              1228367        13421484                9.15

LOCATION                                      SUM(INFECTED) SUM(VACCINATED) INFECTED_VACCINATED
--------------------------------------------- ------------- --------------- -------------------
Switzerland                                          659974         2432568               27.13
Japan                                                593262         2508151               23.65
Netherlands                                         1522973          169032                 901
South Korea                                          122633         3488544                3.52
Iran
```
- 6. Which country does have the highest death rate compare to population?

```
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
```
```
LOCATION                                      POPULATION  SUM(DEAD) HIGHESTRATE
--------------------------------------------- ---------- ---------- -----------
Brazil                                         212559409     404075         .19
United Kingdom                                  67886004     127775         .19
United States                                  331002647     576232         .17
France                                          68147687     107495         .16
Switzerland                                      8654618      10891         .13
Netherlands                                     17134873      17476          .1
Germany                                         83783945      85151          .1
Iran                                            83992953      71758         .09
Canada                                          37742157      25186         .07
India                                         1380004385     213610         .02
Japan                                          126476458      10201         .01

LOCATION                                      POPULATION  SUM(DEAD) HIGHESTRATE
--------------------------------------------- ---------- ---------- -----------
 Samoa                                          25499881          0           0
South Korea                                     51269183       1831           0
Australia                                       25499881       1080           0
China                                         1439323774       5350           0
Papua New Guinea                                25499881          3           0

16 rows selected.
```