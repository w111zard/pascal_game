{ display.pp }
unit display;
interface

uses char_array;

function display_get_height(): integer;
function display_get_width(): integer;

procedure display_clear();
procedure display_show(x, y: integer; obj: char);
procedure display_hide(x, y: integer);
procedure display_show_area(var area: char_array_t);

implementation

uses crt;

function display_get_height(): integer;
begin
    display_get_height := ScreenHeight
end;

function display_get_width(): integer;
begin
    display_get_width := ScreenWidth
end;

procedure display_clear();
begin
    clrscr;
end;

procedure display_show(x, y: integer; obj: char);
begin
    GotoXY(x, y);
    write(obj);
    GotoXY(1, 1)
end;

procedure display_hide(x, y: integer);
begin
    display_show(x, y, ' ');
end;

procedure display_show_area(var area: char_array_t);
var
    x, y: integer;
begin
    for y := 1 to 20 do
        for x := 1 to 20 do
            display_show(x, y, area[y, x])
end;

end.
