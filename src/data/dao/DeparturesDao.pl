% Insertar en la tabla salidas
insertar_salida(IdProducto, Cantidad, Fecha) :-
    conectar,
    format(atom(Query), 'INSERT INTO salidas (id_producto, cantidad, fecha) VALUES (~w, ~w, \'~w\')', [IdProducto, Cantidad, Fecha]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.

% Consultar salidas
consultar_salidas(Salidas) :-
    conectar,
    findall(salida(Id, IdProducto, Cantidad, Fecha),
            odbc_query(inventario_almacen, 'SELECT id_salida, id_producto, cantidad, fecha FROM salidas',
                       row(Id, IdProducto, Cantidad, Fecha)),
            Salidas),
    desconectar.

% Eliminar una salida
eliminar_salida(IdSalida) :-
    conectar,
    format(atom(Query), 'DELETE FROM salidas WHERE id_salida = ~w', [IdSalida]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.

% Actualizar una salida
actualizar_salida(IdSalida, NuevaCantidad, NuevaFecha) :-
    conectar,
    format(atom(Query), 'UPDATE salidas SET cantidad = ~w, fecha = \'~w\' WHERE id_salida = ~w', [NuevaCantidad, NuevaFecha, IdSalida]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.