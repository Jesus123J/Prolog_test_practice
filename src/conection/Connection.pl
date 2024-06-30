

% Conectar a la base de datos
conectar :-
    odbc_connect('XAMPP', _,
                 [alias(inventario_almacen), open(once)]).

% Desconectar de la base de datos
desconectar :-
    odbc_disconnect(inventario_almacen).