{ main.pas }
uses 
    crt,
    display, 
    level, 
    keyboard, 
    game_object, 
    color_char,
    color_char_3d,
    objects; 

function is_empty(x, y: integer): boolean;
begin
    if level_get(level_main, x, y).img = OBJ_SPACE.img then 
        is_empty := true
    else
        is_empty := false
end;

procedure move_game_object(var x, y: integer; dx, dy: integer; obj: color_char_t);
begin
    level_move(level_main, x, y, dx, dy);
    display_hide(x, y);
    x := x + dx;
    y := y + dy;
    display_show(x, y, obj)
end;

procedure player_move(var pl: game_object_t);
begin
    if is_empty(pl.x + pl.dx, pl.y + pl.dy) then
    begin
        move_game_object(pl.x, pl.y, pl.dx, pl.dy, pl.body)
    end;

    pl.dx := 0;
    pl.dy := 0
end;

procedure enemy_move(var en: game_object_t);
var
    dir: array [0..3, 0..1] of integer = ((0, -1), (0, 1), (-1, 0), (1, 0));
    n: integer;
begin
    randomize;
    if is_empty(en.x + en.dx, en.y + en.dy) then
    begin
        move_game_object(en.x, en.y, en.dx, en.dy, en.body);
    end

    else
    begin
        n := random(4);
        en.dx := dir[n][0];
        en.dy := dir[n][1];
    end
end;

var 
    player, enemy: game_object_t;
    key: char; 
begin
    player.x := 10;
    player.y := 10;
    player.body.img := 'x';
    player.body.color := red;    
    
    enemy.x := 5;
    enemy.y := 5;
    enemy.body.img := '!';
    enemy.body.color := yellow;
    enemy.dx := 1;

    display_clear();
    level_add_borders(level_main);
    level_scatter(level_main, 0.1, OBJ_WALL);
    level_set(level_main, player.x, player.y, player.body);
    level_set(level_main, enemy.x, enemy.y, enemy.body);   
    display_show_area(level_main);

    while true do
    begin
        if not keypressed then
        begin
            enemy_move(enemy);
            delay(100);
        end

        else
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
        end;
        player_move(player);
        enemy_move(enemy);
    end;

    display_clear();    
end.
