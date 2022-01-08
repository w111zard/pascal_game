{ display.pp }
unit display;
interface

uses
    color_char,
    color_char_3d,
    objects;

function display_get_height(): integer;
function display_get_width(): integer;

procedure display_clear();
procedure display_show(x, y: integer; obj: color_char_t);
procedure display_hide(x, y: integer);
procedure display_show_area(var area: color_char_3d_t);

implementation

uses 
    crt, images;

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

procedure display_show(x, y: integer; obj: color_char_t);
begin
    { добавляем пробел по оси x после каждого символа } 
    GotoXY(2*x - 1, y);
    textcolor(obj.color);
    write(obj.img);
    GotoXY(1, 1)
end;

procedure display_hide(x, y: integer);
begin
    display_show(x, y, OBJ_SPACE);
end;

procedure display_show_area(var area: color_char_3d_t);
var
    x, y: integer;
begin
    for y := 1 to 20 do
        for x := 1 to 20 do
            display_show(x, y, area[y, x])
end;

end.
