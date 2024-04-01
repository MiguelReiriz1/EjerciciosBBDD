--1 .Devuelve todas las películas
SELECT MOVIE_NAME FROM MOVIES;

--2. Devuelve todos los géneros existentes
SELECT GENRE_NAME FROM genres;

--3. Devuelve la lista de todos los estudios de grabación que estén activos
SELECT STUDIO_NAME FROM STUDIOS WHERE STUDIO_ACTIVE = 1;

--4. Devuelve una lista de los 20 últimos miembros en anotarse al videoclub
SELECT MEMBER_NAME, MEMBER_EXPIRATION_DATE FROM MEMBERS ORDER BY MEMBER_EXPIRATION_DATE DESC LIMIT 20;

--5. Devuelve las 20 duraciones de películas más frecuentes, ordenados de mayor a menor.
SELECT MOVIE_DURATION, COUNT(MOVIE_DURATION) AS FRENCUENCIA FROM MOVIES GROUP BY MOVIE_DURATION ORDER BY FRENCUENCIA DESC LIMIT 20;

--6. Devuelve las películas del año 2000 en adelante que empiecen por la letra A.
SELECT MOVIE_NAME,MOVIE_LAUNCH_DATE FROM MOVIES WHERE MOVIE_LAUNCH_DATE LIKE '2%' AND MOVIE_NAME LIKE 'A%';

-- 7. Devuelve los actores nacidos un mes de Junio
SELECT ACTOR_NAME FROM ACTORS WHERE ACTOR_BIRTH_DATE LIKE '_____06%';

--8. Devuelve los actores nacidos cualquier mes que no sea Junio y que sigan vivos.
SELECT ACTOR_NAME FROM ACTORS WHERE ACTOR_BIRTH_DATE NOT LIKE '_____06%' AND ACTOR_DEAD_DATE IS NULL;

--9. Devuelve el nombre y la edad de todos los directores menores o iguales de 50 años que estén vivos 

-- (INCOMPLETO)
SELECT DIRECTOR_NAME,DIRECTOR_BIRTH_DATE FROM DIRECTORS WHERE DIRECTOR_BIRTH_DATE 
BETWEEN '1974-01-01' AND CURRENT_DATE AND DIRECTOR_DEAD_DATE IS NULL AND SUM(2024 - YEAR(DIRECTOR_BIRTH_DATE));

--10. Devuelve el nombre y la edad de todos los actores menores de 50 años que hayan fallecido

-- (INCOMPLETO)
SELECT ACTOR_NAME FROM ACTORS WHERE ACTOR_BIRTH_DATE 
BETWEEN '1975-01-01' AND CURRENT_DATE AND ACTOR_DEAD_DATE IS NOT NULL;

--11. Devuelve el nombre de todos los directores menores o iguales de 40 años que estén vivos
SELECT DIRECTOR_NAME FROM DIRECTORS WHERE DIRECTOR_BIRTH_DATE 
BETWEEN '1984-01-01'AND CURRENT_DATE AND DIRECTOR_DEAD_DATE IS NULL;



--12. Indica la edad media de los directores vivos

SELECT AVG (DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE,CURRENT_DATE)) YEARS FROM DIRECTORS WHERE DIRECTOR_DEAD_DATE IS NULL;


--13. Indica la edad media de los actores que han fallecido
SELECT AVG (DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE,CURRENT_DATE)) YEARS FROM DIRECTORS WHERE DIRECTOR_DEAD_DATE IS NOT NULL;


--14. Devuelve el nombre de todas las películas y el nombre del estudio que las ha realizado
SELECT M.MOVIE_NAME, S.STUDIO_NAME FROM MOVIES M, STUDIOS S WHERE S.STUDIO_ID = M.STUDIO_ID; 


--15. Devuelve los miembros que alquilaron al menos una película entre el año 2010 y el 2015
SELECT ME.MEMBER_NAME FROM MEMBERS ME, MEMBERS_MOVIE_RENTAL MMR 
WHERE ME.MEMBER_ID = MMR.MEMBER_ID AND YEAR(MMR.MEMBER_RENTAL_DATE)BETWEEN 2010 AND 2015;

--16. Devuelve cuantas películas hay de cada país

-- (INCOMPLETO)
SELECT N.NATIONALITY_NAME, N.NATIONALITY_ID  FROM MOVIES M, NATIONALITIES N 
WHERE N.NATIONALITY_ID = M.NATIONALITY_ID;

--17. Devuelve todas las películas que hay de género documental
SELECT M.MOVIE_NAME, G.GENRE_NAME  FROM MOVIES M, GENRES G 
WHERE G.GENRE_NAME = 'Documentary' AND G.GENRE_ID = M.GENRE_ID ;

--18. Devuelve todas las películas creadas por directores nacidos a partir de 1980 y que todavía están vivos
SELECT M.MOVIE_NAME FROM MOVIES M, DIRECTORS D WHERE YEAR(D.DIRECTOR_BIRTH_DATE)>1980 AND D.DIRECTOR_ID = M.DIRECTOR_ID; 


--19. Indica si hay alguna coincidencia de nacimiento de ciudad (y si las hay, indicarlas) entre los miembros del videoclub y los directores.
SELECT M.MEMBER_TOWN, D.DIRECTOR_BIRTH_PLACE 
FROM MEMBERS M, DIRECTORS D WHERE M.MEMBER_TOWN=D.DIRECTOR_BIRTH_PLACE;

--20. Devuelve el nombre y el año de todas las películas que han sido producidas por un estudio que actualmente no esté activo
SELECT M.MOVIE_NAME, YEAR(M.MOVIE_LAUNCH_DATE) FROM MOVIES M, STUDIOS S WHERE STUDIO_ACTIVE = 0 AND M.STUDIO_ID = S.STUDIO_ID; 

--21. Devuelve una lista de las últimas 10 películas que se han alquilado
SELECT MOVIE_NAME,MMR.MEMBER_RENTAL_DATE FROM MOVIES M, MEMBERS_MOVIE_RENTAL MMR 
WHERE M.MOVIE_ID = MMR.MOVIE_ID ORDER BY MMR.MEMBER_RENTAL_DATE DESC LIMIT 10; 

--22. Indica cuántas películas ha realizado cada director antes de cumplir 41 años
SELECT D.DIRECTOR_NAME, COUNT(*) AS num_peliculas FROM DIRECTORS D, MOVIES M 
WHERE DATEDIFF(YEAR, D.DIRECTOR_BIRTH_DATE, CURRENT_DATE) <=41 
AND  D.DIRECTOR_ID = M.DIRECTOR_ID GROUP BY D.DIRECTOR_NAME, D.DIRECTOR_ID;


--23. Indica cuál es la media de duración de las películas de cada director
SELECT D.DIRECTOR_NAME, AVG(M.MOVIE_DURATION) FROM MOVIES M, DIRECTORS D
WHERE D.DIRECTOR_ID = M.DIRECTOR_ID GROUP BY D.DIRECTOR_NAME;

--24. Indica cuál es el nombre y la duración mínima de la película que ha sido alquilada en los últimos 2 años por los miembros del videoclub 
--(La "fecha de ejecución" en este script es el 25-01-2019)

-- 25. Indica el número de películas que hayan hecho los directores durante las décadas de los 60, 70 y 80 
--que contengan la palabra "The" en cualquier parte del título
-- (INCOMPLETO)
SELECT D.DIRECTOR_NAME, COUNT(*) AS num_peliculas FROM DIRECTORS D, MOVIES M 
WHERE M.MOVIE_LAUNCH_DATE LIKE '196%' OR M.MOVIE_LAUNCH_DATE LIKE '197%' OR M.MOVIE_LAUNCH_DATE LIKE '198%'
AND M.MOVIE_NAME LIKE 'The%' AND M.DIRECTOR_ID = D.DIRECTOR_ID
GROUP BY D.DIRECTOR_NAME;

