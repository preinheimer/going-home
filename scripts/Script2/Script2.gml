// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawTextBox(xx, yy, text, font, color, backcolor){


	if(font_exists(font)) draw_set_font(font); // set font if it exists

	var width=300; // maximum width of the textbox
	var height=string_height_ext(text,-1,width);
	var w=width div 2+4; // used in centering background around text
	var h=height div 2+4;
	var border=2; // how many pixel border

	draw_set_halign(fa_center); // draw text centered both hor and vert
	draw_set_valign(fa_middle);

	// draw the background
	draw_rectangle_colour(xx - w - border, yy-h-border, xx+w+border, yy+h+border, color,color,color,color,false);
	draw_rectangle_colour(xx-w, yy-h, xx+w, yy+h, backcolor,backcolor,backcolor,backcolor,false);

	// draw the text
	draw_text_ext_colour(xx,yy,text,-1,width,color,color,color,color,1);

	// reset character alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	show_debug_message("Drew a text box I guess");

	
}