{ game_object.pp }
unit game_object;
interface

uses color_char;

type game_object_t = record
    x, y, dx, dy: integer;
    body: color_char_t;
end;

implementation

end.
