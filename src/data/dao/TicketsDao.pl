
:- ['../../conection/Connection.pl'].

% Actualizar una entrada
actualizar_entrada(IdEntrada, NuevaCantidad, NuevaFecha) :-
    conectar,
    format(atom(Query), 'UPDATE entradas SET cantidad = ~w, fecha = \'~w\' WHERE id_entrada = ~w', [NuevaCantidad, NuevaFecha, IdEntrada]),
    odbc_query(conexion, Query, _),
    desconectar.

% Eliminar una entrada
eliminar_entrada(IdEntrada) :-
    conectar,
    format(atom(Query), 'DELETE FROM entradas WHERE id_entrada = ~w', [IdEntrada]),
    odbc_query(conexion, Query, _),
    desconectar.


% Insertar en la tabla entradas
insertar_entrada(IdProducto, IdProveedor, Cantidad, Fecha) :-
    conectar,
    format(atom(Query), 'INSERT INTO entradas (id_producto, id_proveedor, cantidad, fecha) VALUES (~w, ~w, ~w, \'~w\')', [IdProducto, IdProveedor, Cantidad, Fecha]),
    odbc_query(conexion, Query, _),
    desconectar.

% Consultar entradas
consultar_entradas(Entradas) :-
    conectar,
    findall(entrada(Id, IdProducto, IdProveedor, Cantidad, Fecha),
            odbc_query(conexion, 'SELECT id_entrada, id_producto, id_proveedor, cantidad, fecha FROM entradas',
                       row(Id, IdProducto, IdProveedor, Cantidad, Fecha)),
            Entradas),
    desconectar.
