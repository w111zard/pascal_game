{ objects.pp }
unit objects;
interface

uses
    crt, color_char;

const
    OBJ_SPACE: color_char_t = (img: ' '; color: black);
    OBJ_WALL: color_char_t = (img: '#'; color: white);

implementation

end.
