{ main.pas }
uses display, level, keyboard; 
var 
    x, y, dx, dy: integer;
    key: char;
begin
    level_add_borders(level_main);
    x := 10;
    y := 10;
    level_add(level_main, x, y, 'x');

    display_clear();
    display_show_area(level_main);

    while true do
        
    begin
        dx := 0;
        dy := 0;

        key := keyboard_read();
        case key of
            #27:
                break;
            #75: 
                dx := -1;
            #77:
                dx := 1;
            #72:
                dy := -1;
            #80:
                dy := 1;
        end;

        if (dx <> 0) or (dy <> 0) then
        begin
            level_move(level_main, x, y, dx, dy);
            display_hide(x, y);
            x := x + dx;
            y := y + dy;
            display_show(x, y, 'x')
        end;
    end; 

    display_clear();    
end.
