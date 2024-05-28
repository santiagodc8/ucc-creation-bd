--Punto 1

create or replace function producto_mayor_valor(categoria_nombre char(50))
returns char(50) as $$
declare
    producto_nombre char(50);
begin
    select p.descripcion
    into producto_nombre
    from productos p
    join categorias c on p.categoriaid = c.categoriaid
    where c.nombrecat = categoria_nombre
    order by p.preciounit desc
    limit 1;

    return producto_nombre;
end;
$$ language plpgsql;



SELECT producto_mayor_valor('CARNICOS');

select * from categorias;
select * from productos;



--Punto 2

create or replace function productos_por_proveedor(proveedor_id int)
returns table(productoid int, preciounit numeric, existencia int) as $$
begin
    return query
    select p.productoid, p.preciounit, p.existencia
    from productos p
    where p.proveedorid = proveedor_id;
end;
$$ language plpgsql;


SELECT * FROM productos_por_proveedor(20);

select * from clientes;
select * from proveedores;
