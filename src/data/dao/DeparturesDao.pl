:- ['../../conection/Connection.pl'].

% Insertar en la tabla salidas
insertar_salida(IdProducto, Cantidad, Fecha) :-
    conectar,
    format(atom(Query), 'INSERT INTO salidas (id_producto, cantidad, fecha) VALUES (~w, ~w, \'~w\')', [IdProducto, Cantidad, Fecha]),
    odbc_query(conexion, Query, _),
    desconectar.

% Consultar salidas
consultar_salidas(Salidas) :-
    conectar,
    findall(salida(Id, IdProducto, Cantidad, Fecha),
            odbc_query(conexion, 'SELECT id_salida, id_producto, cantidad, fecha FROM salidas',
                       row(Id, IdProducto, Cantidad, Fecha)),
            Salidas),
    desconectar.

% Eliminar una salida
eliminar_salida(IdSalida) :-
    conectar,
    format(atom(Query), 'DELETE FROM salidas WHERE id_salida = ~w', [IdSalida]),
    odbc_query(conexion, Query, _),
    desconectar.

% Actualizar una salida
actualizar_salida(IdSalida, NuevaCantidad, NuevaFecha) :-
    conectar,
    format(atom(Query), 'UPDATE salidas SET cantidad = ~w, fecha = \'~w\' WHERE id_salida = ~w', [NuevaCantidad, NuevaFecha, IdSalida]),
    odbc_query(conexion, Query, _),
    desconectar.
