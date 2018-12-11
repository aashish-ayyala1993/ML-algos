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

select invoiceid, Total
from invoices
where total not between 14.91 and 18.86
order by total
limit 10;

select albumid, count(composer)
from tracks
group by composer
order by albumid
limit 50;

select albumid, sum(milliseconds) as length, sum(bytes) as size
from tracks
group by 1
having length > 600000;

--CASE WHEN STARTED
select customerid, firstname, lastname, country,
CASE country when 'USA'
then'Foreign'
end Customergroup
from customers
order by
firstname, lastname;


