--
/*sajhsdsad*/

select
1+4 as sum1;

select
1+4 as relation0,2*3 as relation1;

select trackid,name,composer,unitprice
from tracks;

select*
from tracks;

select distinct city
from customers;

select company
from customers;

select distinct company
from customers;

select Milliseconds, Name, AlbumId
from tracks
order by albumid desc;

select Milliseconds, Name, AlbumId
from tracks
order by 3 asc;

select Milliseconds, Name, AlbumId
from tracks
order by 3 asc, 1 desc;

select trackid, name
from tracks
limit 15;

select trackid, name
from tracks
limit 10 offset 20;

select name, bytes
from tracks
order by bytes desc
limit 10;

select customerid, firstname, company
from customers
where company is null;

select trackid, name, albumid
from tracks
where albumid = 1;

select trackid, name, albumid, milliseconds
from tracks
where albumid = 1 and milliseconds > 250000;

select trackid, name, albumid
from tracks
where albumid in(1,2,3);

select trackid, name, albumid, composer
from tracks
where composer like "%smith%"

select trackid, name, albumid
from tracks
where albumid not in(1,2,3);

select invoiceid, Total
from invoices
where total between 14.91 and 18.86
order by total
limit 10;

select invoiceid, Total
from invoices
where total > 14.91  < 18.86
order by total
limit 10;

select trackid
from playlist_track
where trackid > 3300
limit 50;

select albumid,genreid,
sum(milliseconds) as length,
sum(bytes) as sizes
from tracks
group by genreid
having genreid =1 and genreid = 2;

--
select albumid, sum(milliseconds) as length, sum(bytes) as sizes
from tracks
where genreid in (1,2)
group by albumid
having milliseconds > 60000;

--Complex queries
--flow of sql

--create table complex queries
create table customer city
(cust_id integer, city varchar(40))

insert into customer_city
values
(1,'Mumbai'),
(1,'Delhi'),
(2,'Kolkata'),
(2,'South Chennai');

select Name,Title,TrackId
from tracks inner join albums on albums.albumid = tracks.AlbumId;

--for artist id 10 give title artist and track
select 
TrackId,
tracks.name as track,
albums.Title as albums,
artists.name as artists
from
tracks
	inner join albums on albums.AlbumId = tracks.AlbumId
	inner join artists on artists.ArtistId = albums.ArtistId
where albums.ArtistId = 10;

--artists without albums
select
artists.ArtistId,
albums.albumid
from
artists
	left join albums on albums.ArtistId = artists.Artistid
where albumid is null;

-- My effort
select
artists.ArtistId as artist,
albums.albumid as album
from
artists
	left join albums on albums.ArtistId = artists.Artistid;

--the albums having tracks gretaer than 15 	
select
albums.Title,
count(tracks.Name) as No_of_tracks
from
tracks left join albums on albums.AlbumId = tracks.AlbumId
group by albums.Title having No_of_tracks >15;

--Albums with total legth grater than 60000000 milliseconds and also max min average of length of track someting
select albums.AlbumId, albums.Title, min(milliseconds),max(milliseconds),round(avg(milliseconds)),total(milliseconds)
from tracks inner join albums on albums.AlbumId = tracks.AlbumId
group by tracks.AlbumId having total(milliseconds)>60000000;

select firstname, lastname
from employees
union all
select firstname, lastname
from employees;

select firstname, lastname
from employees
union
select firstname, lastname
from employees;

--Except operator and intersect operator - pending

--find all the tracks in album let there be rock 
select 
tracks.TrackId,
tracks.name a
from
tracks inner join albums on albums.AlbumId = tracks.AlbumId
where albums.Title like "Let there be rock";

--SUB queries
--find all the tracks in album let there be rock 
select trackid,name,albumid
from tracks
where albumid = ( select albumid
from albums
where title = 'Let There Be Rock');


select name
from tracks
where albumid in(select albumid
					from albums
					where title like "Let there be rock");

--get the tracks that belong to the artist id 12
select name
from tracks
where albumid in(select albumid
from albums
where artistid =12);



--get the tracks that belong to the artist id 12
select name
from tracks
where albumid in (select albumid
					from albums
					where artistid = 12);



--Find the customers where sales representative are in Canada
select firstname
from customers
where supportrepid in (select employeeid from employees where country like "Canada");

select firstname
from customers
where supportrepid in(select employeeid from employees where country like "Canada");


--get the average album size in bytes
select avg(albums.size)
from (select albumid ,sum(bytes) as size from tracks group by (albumid)) as album;



--Find the customers where sales representative are in Canada
select supportrepid
from customers