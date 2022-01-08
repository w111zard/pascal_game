{ main.pas }
uses display, level, keyboard, game_object; 

procedure player_move(var pl: game_object_t);
var
    new_x, new_y: integer;
begin
    new_x := pl.x + pl.dx;
    new_y := pl.y + pl.dy;

    if level_get(level_main, new_x, new_y) = ' ' then
    begin
        level_move(level_main, pl.x, pl.y, pl.dx, pl.dy);
        display_hide(pl.x, pl.y);
        pl.x := new_x;
        pl.y := new_y;
        display_show(pl.x, pl.y, pl.img) 
    end;

    pl.dx := 0;
    pl.dy := 0
end;

var 
    player: game_object_t;
    key: char; 
begin
    player.x := 10;
    player.y := 10;
    player.img := 'x';

    level_add_borders(level_main);
    level_scatter(level_main, 0.1, '#');
    level_set(level_main, player.x, player.y, player.img);

    display_clear();
    display_show_area(level_main);

    while true do
    begin
        key := keyboard_read();
        case key of
            #27:
                break;
            #75: 
                player.dx := -1;
            #77:
                player.dx := 1;
            #72:
                player.dy := -1;
            #80:
                player.dy := 1;
        end;

        if (player.dx <> 0) or (player.dy <> 0) then
            player_move(player)
    end; 

    display_clear();    
end.
