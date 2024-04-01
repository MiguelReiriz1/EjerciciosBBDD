--1 .Devuelve todas las películas
SELECT MOVIE_NAME FROM MOVIES;

--2. Devuelve todos los géneros existentes
SELECT GENRE_NAME FROM genres;

--3. Devuelve la lista de todos los estudios de grabación que estén activos
SELECT STUDIO_NAME FROM STUDIOS WHERE STUDIO_ACTIVE = 1;

--4. Devuelve una lista de los 20 últimos miembros en anotarse al videoclub
SELECT MEMBER_NAME, MEMBER_EXPIRATION_DATE FROM MEMBERS WHERE MEMBER_EXPIRATION_DATE > '2021-09-04';

--5. Devuelve las 20 duraciones de películas más frecuentes, ordenados de mayor a menor.
SELECT MOVIE_DURATION, COUNT(MOVIE_DURATION) FROM MOVIES GROUP BY MOVIE_DURATION ORDER BY MOVIE_DURATION DESC;

--6. Devuelve las películas del año 2000 en adelante que empiecen por la letra A.
SELECT MOVIE_NAME,MOVIE_LAUNCH_DATE FROM MOVIES WHERE MOVIE_LAUNCH_DATE LIKE '2%' AND MOVIE_NAME LIKE 'A%';

-- 7. Devuelve los actores nacidos un mes de Junio
SELECT ACTOR_NAME FROM ACTORS WHERE ACTOR_BIRTH_DATE LIKE '_____06%';

--8. Devuelve los actores nacidos cualquier mes que no sea Junio y que sigan vivos.
SELECT ACTOR_NAME FROM ACTORS WHERE ACTOR_BIRTH_DATE NOT LIKE '_____06%' AND ACTOR_DEAD_DATE IS NULL;

--9. Devuelve el nombre y la edad de todos los directores menores o iguales de 50 años que estén vivos
SELECT DIRECTOR_NAME,DIRECTOR_BIRTH_DATE FROM DIRECTORS WHERE DIRECTOR_BIRTH_DATE 
BETWEEN '1974-01-01' AND CURRENT_DATE AND DIRECTOR_DEAD_DATE IS NULL;






