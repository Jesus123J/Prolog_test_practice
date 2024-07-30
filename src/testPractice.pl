

:- use_module(library(pce)).

% Crear la ventana principal
create_main_window :-
    new(Window, dialog('Mi Aplicación Prolog')),
    send(Window, append, new(TextBox, text_item('Texto'))),
    send(Window, append, button(ok, message(@prolog, handle_text, TextBox?selection))),
    send(Window, append, button(cancel, message(Window, destroy))),
    send(Window, open).

% Manejar el texto ingresado en la caja de texto
handle_text(Text) :-
    format('Texto ingresado: ~w~n', [Text]).

% Inicializar la aplicación
:- initialization(create_main_window).
