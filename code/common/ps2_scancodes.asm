PS2_SCANCODES:
		DB 0EH, '`', '~'
		DB 16H, '1', '!'
		DB 1EH, '2', '@'
		DB 26H,	'3', '#'
		DB 25H,	'4', '$'
		DB 2EH,	'5', '%'
		DB 36H, '6', '^'
		DB 3DH,	'7', '&'
		DB 3EH, '8', '*'
		DB 46H, '9', '('
		DB 45H,	'0', ')'
		DB 4EH, '-', '_'
		DB 55H, '=', '+'
		DB 66H, 08H, 08H				;Bacspace here!!!!
		DB 0DH, 09H, 09H				;TAB here!!!!!
		DB 15H, 'q', 'Q'
		DB 1DH, 'w', 'W'
		DB 24H, 'e', 'E'
		DB 2DH, 'r', 'R'
		DB 2CH, 't', 'T'
		DB 35H, 'y', 'Y'
		DB 3CH, 'u', 'U'
		DB 43H, 'i', 'I'
		DB 44H, 'o', 'O'
		DB 4DH, 'p', 'P'
		DB 54H, '[', '{'
		DB 5BH, ']', '}'
		DB 58H, 00H, 00H				;CAPSLOCK here!!!!
		DB 1CH, 'a', 'A'
		DB 1BH, 's', 'S'
		DB 23H, 'd', 'D'
		DB 2BH, 'f', 'F'
		DB 34H, 'g', 'G'
		DB 33H, 'h', 'H'
		DB 3BH, 'j', 'J'
		DB 42H, 'k', 'K'
		DB 4BH, 'l', 'L'
		DB 4CH, ';', ':'
		DB 52H, 27H, 22H				; ' and "
		DB 5AH, 0DH, 0DH				;ENTER here!!!!!
		DB 1AH, 'z', 'Z'
		DB 22H, 'x', 'X'
		DB 21H, 'c', 'C'
		DB 2AH, 'v', 'V'
		DB 32H, 'b', 'B'
		DB 31H, 'n', 'N'
		DB 3AH, 'm', 'M'
		DB 41H, ',', '<'
		DB 49H, '.', '>'
		DB 4AH, '/', '?'
		DB 29H, ' ', ' '
		DB 76H, 03H, 03H				;Ctrl+C
PS2_SCANCODES_END: 