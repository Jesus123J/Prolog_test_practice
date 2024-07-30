:- use_module(library(pce)).
:- use_module(library(pce_style_item)).
:- ['conection/Connection.pl'].
:- ['data/dao/DeparturesDao.pl'].
:- ['data/dao/ProductDao.pl'].
:- ['data/dao/SuppliersDao.pl'].
:- ['data/dao/TicketsDao.pl'].



% Crear la ventana principal
create_main_window :-
    new(Window, dialog('Insertar Producto')),
    send(Window, append, new(IdItem, int_item('ID Producto'))),
    send(Window, append, new(NameItem, text_item('Nombre'))),
    send(Window, append, new(DescriptionItem, text_item('Descripción'))),
    send(Window, append, new(PriceItem, real_item('Precio'))),
    send(Window, append, new(StockItem, int_item('Stock'))),
    send(Window, append, new(CategoryIdItem, int_item('ID Categoría'))),
    send(Window, append, button(insertar, 
                                message(@prolog, insertar_producto, 
                                        IdItem?selection, 
                                        NameItem?selection, 
                                        DescriptionItem?selection, 
                                        PriceItem?selection, 
                                        StockItem?selection, 
                                        CategoryIdItem?selection))),
    send(Window, append, button(cancel, message(Window, destroy))),
    send(Window, open).

% Inicializar la aplicación
:- initialization(create_main_window).