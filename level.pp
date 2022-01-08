{ level.pp }
unit level;
interface

uses color_char, color_char_3d, objects;
var
    level_main: color_char_3d_t;

procedure level_add_borders(var layer: color_char_3d_t);
procedure level_set(var layer: color_char_3d_t; x, y: integer; obj: color_char_t);
procedure level_delete(var layer: color_char_3d_t; x, y: integer);
procedure level_move(var layer: color_char_3d_t; x, y, dx, dy: integer);
procedure level_scatter(var layer: color_char_3d_t; chance: real; obj: color_char_t);

function level_get(var layer: color_char_3d_t; x, y: integer): color_char_t; 

implementation

procedure level_set(var layer: color_char_3d_t; x, y: integer; obj: color_char_t);
begin
    layer[y, x] := obj
end;

procedure level_delete(var layer: color_char_3d_t; x, y: integer);
begin
    layer[y, x] := OBJ_SPACE;
end;

function level_get(var layer: color_char_3d_t; x, y: integer): color_char_t;
begin
    level_get := layer[y, x] 
end;

procedure level_move(var layer: color_char_3d_t; x, y, dx, dy: integer);
var
    obj: color_char_t;
begin
    obj := level_get(layer, x, y);
    level_delete(layer, x, y);
    level_set(layer, x + dx, y + dy, obj)
end;

function is_border(x, y: integer): boolean;
begin
    if (x = 1) or (y = 1) or (x = 20) or (y = 20) then
        is_border := true
    else
        is_border := false
end;

procedure level_add_borders(var layer: color_char_3d_t);
var
    x, y: integer;
begin
    for y := 1 to 20 do
    begin
        for x := 1 to 20 do
        begin
            if is_border(x, y) then
                layer[y, x] := OBJ_WALL
            else
                layer[y, x] := OBJ_SPACE;
        end
    end
end;

procedure level_scatter(var layer: color_char_3d_t; chance: real; obj: color_char_t);
var
    x, y: integer;
    res: real;
begin
    randomize;

    for x := 2 to 19 do
    begin
        for y := 2 to 19 do
        begin
          res := random(100) / 100;
          if res < chance then
              level_set(layer, x, y, obj)
        end
    end
end;

end.
