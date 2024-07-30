% Actualizar una entrada
actualizar_entrada(IdEntrada, NuevaCantidad, NuevaFecha) :-
    conectar,
    format(atom(Query), 'UPDATE entradas SET cantidad = ~w, fecha = \'~w\' WHERE id_entrada = ~w', [NuevaCantidad, NuevaFecha, IdEntrada]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.

% Eliminar una entrada
eliminar_entrada(IdEntrada) :-
    conectar,
    format(atom(Query), 'DELETE FROM entradas WHERE id_entrada = ~w', [IdEntrada]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.

% Insertar en la tabla entradas
insertar_entrada(IdProducto, IdProveedor, Cantidad, Fecha) :-
    conectar,
    format(atom(Query), 'INSERT INTO entradas (id_producto, id_proveedor, cantidad, fecha) VALUES (~w, ~w, ~w, \'~w\')', [IdProducto, IdProveedor, Cantidad, Fecha]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.

% Consultar entradas
consultar_entradas(Entradas) :-
    conectar,
    findall(entrada(Id, IdProducto, IdProveedor, Cantidad, Fecha),
            odbc_query(inventario_almacen, 'SELECT id_entrada, id_producto, id_proveedor, cantidad, fecha FROM entradas',
                       row(Id, IdProducto, IdProveedor, Cantidad, Fecha)),
            Entradas),
    desconectar.