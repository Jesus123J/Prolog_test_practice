% Insertar en la tabla proveedores
insertar_proveedor(Nombre, Contacto, Telefono) :-
    conectar,
    format(atom(Query), 'INSERT INTO proveedores (nombre, contacto, telefono) VALUES (\'~w\', \'~w\', \'~w\')', [Nombre, Contacto, Telefono]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.

% Eliminar un proveedor
eliminar_proveedor(IdProveedor) :-
    conectar,
    format(atom(Query), 'DELETE FROM proveedores WHERE id_proveedor = ~w', [IdProveedor]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.

% Consultar todos los proveedores
consultar_todos_proveedores(Proveedores) :-
    conectar,
    findall(proveedor(Id, Nombre, Contacto, Telefono),
            odbc_query(inventario_almacen, 'SELECT id_proveedor, nombre, contacto, telefono FROM proveedores',
                       row(Id, Nombre, Contacto, Telefono)),
            Proveedores),
    desconectar.

% Actualizar proveedor
actualizar_proveedor(IdProveedor, NuevoNombre, NuevoContacto, NuevoTelefono) :-
    conectar,
    format(atom(Query), 'UPDATE proveedores SET nombre=\'~w\', contacto=\'~w\', telefono=\'~w\' WHERE id_proveedor = ~w', 
           [NuevoNombre, NuevoContacto, NuevoTelefono, IdProveedor]),
    catch(
        odbc_query(inventario_almacen, Query, _),
        Error,
        (write('Error ejecutando la consulta: '), writeln(Error), fail)
    ),
    desconectar.
    
