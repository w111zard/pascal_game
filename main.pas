{ main.pas }
uses display, level; 

var
    x, y: integer;
begin
    display_clear();
    
    level_add_borders(level_main);
    display_show_area(level_main);
    
    level_add(level_main, 10, 10, 'x');
    display_show(10, 10, 'x');
    
    readln();
    
    level_move(level_main, 10, 10, 1, 0);
    display_hide(10, 10);
    display_show(11, 10, 'x'); 

    readln();

    display_clear();     
end.
