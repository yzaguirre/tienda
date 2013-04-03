--consiga el titulo, precio y cantidad de ventas de todos los productos a un precio que ocila entre 22 y 25, que se hayan vendido mas de 20.
select title, price, sales 
from producto 
where price > 22 and price < 25 and sales > 20 
order by price ASC;

--consiga los nombres de los clientes que su primer nombre empiece con las letras FU
select firstname, lastname from cliente where firstname like 'FU%';

--una lista de clientes que tienen mas de 30 ordenes
select cl.firstname, ordenes.NumOrden
from cliente cl
inner join (
	select customerid, count(orderid) as NumOrden
	from orden
	group by customerid
	having count(orderid)>30) ordenes
on (cl.customerid=ordenes.customerid)

--muestre el numero de clientes por pais
select country, conteo 
from pais 
inner join (
	select country_id, count(firstname) as conteo
	from cliente 
	group by country_id) clientes 
on (pais.country_id = clientes.country_id);

--Lista de vendedores y cantidad de ventas
select vendedor.vendor_name, NumVentas
from vendedor
inner join (
	select vendor_id, count(distinct orderid) as NumVentas
	from orden
	group by vendor_id
) vendedores
on (vendedor.vendor_id = vendedores.vendor_id)
order by NumVentas desc