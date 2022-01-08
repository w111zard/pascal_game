{ keyboard.pp }
unit keyboard;
interface

function keyboard_read(): char;

implementation

uses crt;

function keyboard_read: char;
var
    key: char;
begin
    key := readkey;
    if key = #0 then { получаем расширенный код }
        key := readkey;
    keyboard_read := key
end;

end.
