{ main.pas }
uses display, level; 

var
    x, y: integer;
begin
    display_clear();
    
    level_add_borders();
    readln();

    display_clear();     
end.
