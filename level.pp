{ level.pp }
unit level;
interface

uses char_array;
var
    level_main: char_array_t;

procedure level_add_borders(var layer: char_array_t);

implementation

function is_border(x, y: integer): boolean;
begin
    if (x = 1) or (y = 1) or (x = W) or (y = H) then
        is_border := true
    else
        is_border := false
end;

procedure level_add_borders(var layer: char_array_t);
var
    x, y: integer;
begin
    for y := 1 to H do
    begin
        for x := 1 to W do
        begin
            if is_border(x, y) then
                layer[y, x] := '#'
            else
                layer[y, x] := ' '
        end
    end
end;

end.
