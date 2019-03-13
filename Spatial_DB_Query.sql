CREATE EXTENSION postgis;

create table Locations (
latitude float,
longitude float
);

alter table Locations add column L_Name varchar(50);

insert into Locations (l_name,longitude,latitude) 
values ('Home',-118.288718,34.03106);

insert into Locations (l_name,longitude,latitude) 
values ('CAL',-118.276454,34.019183),
('Marshall', -118.286296,34.018495),
('Vermont/Exposition', -118.291501,34.018464),
('Pardee', -118.283558,34.018421),
('International_Academy',-118.281431,34.021578),
('Leavy', -118.283516,34.021579),
('Shrine-Gate', -118.282601,34.022612),
('Lyon-Center', -118.287775,34.024367),
('USC-Bookstore', -118.286345,34.020852),
('Tommy_Trojan', -118.285495,34.02039),
('SGM123', -118.28931,34.021289);

select * from Locations;

create table Geometry_of_Loc AS (Select ST_SetSRID(ST_MakePoint(longitude, latitude),4326) as Geom, l_name from Locations);
select * from geometry_of_loc;

select ST_AsText(geom) from Geometry_of_Loc;

Select ST_AsText(ST_ConvexHull(ST_Union(geom))) as Poly from Geometry_of_Loc;
										
select ST_AsText(G2.geom) from Geometry_of_Loc G1,Geometry_of_Loc G2  
where G1.l_name = 'Home' and G2.l_name <>'Home'										
ORDER by ST_Distance(G1.geom, G2.geom) ASC LIMIT 5;
										
select * from Locations;