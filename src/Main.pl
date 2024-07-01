:- ['data/dao/MethodDao.pl'].

% Ejemplos de uso
% ---------------

% Ejemplo de inserción de proveedor
ejemplo_insertar_proveedor :-
    insertar_proveedor('Proveedor X', 'Contacto X', '123456789').

% Ejemplo de actualización de proveedor
ejemplo_actualizar_proveedor :-
    actualizar_proveedor(1, 'Nuevo Nombre', 'Nuevo Contacto', '987654321').

% Ejemplo de eliminación de proveedor
ejemplo_eliminar_proveedor :-
    eliminar_proveedor(2).

% Ejemplo de inserción de entrada
ejemplo_insertar_entrada :-
    insertar_entrada(1, 1, 50, '2024-06-30').

% Ejemplo de actualización de entrada
ejemplo_actualizar_entrada :-
    actualizar_entrada(1, 60, '2024-07-01').

% Ejemplo de eliminación de entrada
ejemplo_eliminar_entrada :-
    eliminar_entrada(2).

% Ejemplo de inserción de salida
ejemplo_insertar_salida :-
    insertar_salida(1, 20, '2024-06-30').

% Ejemplo de actualización de salida
ejemplo_actualizar_salida :-
    actualizar_salida(1, 25, '2024-07-01').

% Ejemplo de eliminación de salida
ejemplo_eliminar_salida :-
    eliminar_salida(2).