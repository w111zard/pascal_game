{ main.pas }
uses display, level; 

var
    x, y: integer;
begin
    display_clear();
    
    level_add_borders(level_main);
    display_show_area(level_main);
    readln();

    display_clear();     
end.
