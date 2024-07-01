:- ['../../conection/Connection.pl'].

% Consultar datos de la tabla productos
consultar_productos :-
    conectar,
    findall(producto(Id, Nombre, Descripcion, Precio, Stock, IdCategoria),
            odbc_query(inventario_almacen,
                       'SELECT id_producto, nombre, descripcion, precio, stock, id_categoria FROM productos',
                       row(Id, Nombre, Descripcion, Precio, Stock, IdCategoria)),
            Productos),
    desconectar,
    imprimir_productos(Productos).

% Imprimir resultados de la consulta
imprimir_productos([]).
imprimir_productos([producto(Id, Nombre, Descripcion, PrecioAtom, Stock, IdCategoria) | T]) :-
    atom_number(PrecioAtom, Precio),  % Convertir el precio de átomo a número
    format('Id: ~w, Nombre: ~w, Descripción: ~w, Precio: ~2f, Stock: ~w, IdCategoria: ~w~n',
           [Id, Nombre, Descripcion, Precio, Stock, IdCategoria]),
    imprimir_productos(T).


insertar_producto(Id, Nombre, Descripcion, Precio, Stock, IdCategoria) :-
    conectar,
    format(atom(SQL), 'INSERT INTO productos (id_producto, nombre, descripcion, precio, stock, id_categoria) VALUES (~w, "~w", "~w", ~2f, ~w, ~w)', 
           [Id, Nombre, Descripcion, Precio, Stock, IdCategoria]),
    odbc_query(inventario_almacen, SQL),
    desconectar.

actualizar_producto(Id, Nombre, Descripcion, Precio, Stock, IdCategoria) :-
    conectar,
    format(atom(SQL), 'UPDATE productos SET nombre = "~w", descripcion = "~w", precio = ~2f, stock = ~w, id_categoria = ~w WHERE id_producto = ~w', 
           [Nombre, Descripcion, Precio, Stock, IdCategoria, Id]),
    odbc_query(inventario_almacen, SQL),
    desconectar.

eliminar_producto(Id) :-
    conectar,
    format(atom(SQL), 'DELETE FROM productos WHERE id_producto = ~w', [Id]),
    odbc_query(inventario_almacen, SQL),
    desconectar.

