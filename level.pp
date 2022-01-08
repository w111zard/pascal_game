{ level.pp }
unit level;
interface

uses char_array;
var
    level_main: char_array_t;

procedure level_add_borders(var layer: char_array_t);
procedure level_add(var layer: char_array_t; x, y: integer; obj: char);
procedure level_delete(var layer: char_array_t; x, y: integer);
procedure level_move(var layer: char_array_t; x, y, dx, dy: integer);

function level_get(var layer: char_array_t; x, y: integer): char; 

implementation

procedure level_add(var layer: char_array_t; x, y: integer; obj: char);
begin
    layer[y, x] := obj
end;

procedure level_delete(var layer: char_array_t; x, y: integer);
begin
    layer[y, x] := ' ';
end;

function level_get(var layer: char_array_t; x, y: integer): char;
begin
    level_get := layer[y, x] 
end;

procedure level_move(var layer: char_array_t; x, y, dx, dy: integer);
var
    obj: char;
begin
    obj := level_get(layer, x, y);
    level_delete(layer, x, y);
    level_add(layer, x + dx, y + dy, obj)
end;

function is_border(x, y: integer): boolean;
begin
    if (x = 1) or (y = 1) or (x = 20) or (y = 20) then
        is_border := true
    else
        is_border := false
end;

procedure level_add_borders(var layer: char_array_t);
var
    x, y: integer;
begin
    for y := 1 to 20 do
    begin
        for x := 1 to 20 do
        begin
            if is_border(x, y) then
                layer[y, x] := '#'
            else
                layer[y, x] := ' '
        end
    end
end;

end.
