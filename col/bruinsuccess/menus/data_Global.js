//  QuickMenu Pro, Copyright (c) 1998 - 2003, OpenCube Inc. - http://www.opencube.com
/*
code0 = 2041
code1 = 1588
code2 = 708
code3 = 1964
code4 = 1991
code5 = 1588
code6 = 604
code7 = 1735
code8 = 713
code9 = 2525
*/
limit_multiple_users = true
restrict_access = true 
sequence = '9x44_5'
/*-------------------------------------------
Colors, Borders, Dividers, and more...
--------------------------------------------*/
	dqm__sub_menu_width = 324      	//default sub menu widths
	dqm__sub_xy = "0,0"            	//default sub x,y coordinates - defined relative
						            //to the top-left corner of parent image or sub menu
   	dqm__urltarget = "_self"		//default URL target: _self, _parent, _new, or "my frame name"
	dqm__border_width = 1
	dqm__divider_height = 1
	dqm__border_color = "#000000"		//Hex color or 'transparent'
	dqm__menu_bgcolor = "#666666"		//Hex color or 'transparent'
	dqm__hl_bgcolor = "#536895"		
	dqm__mouse_off_delay = 50		//defined in milliseconds (activated after mouse stops)
	dqm__nn4_mouse_off_delay = 250		//defined in milliseconds (activated after leaving sub)
/*-------------------------------------------
Font settings and margins
--------------------------------------------*/
    //Font settings
	dqm__textcolor = "#FFFFFF"
	dqm__fontfamily = "Comic Sans MS, Verdana, Arial, Helvetica, sans-serif"		//Any available system font     
	dqm__fontsize = 12			//Defined with pixel sizing  	
	dqm__fontsize_ie4 = 12			//Defined with point sizing
	dqm__textdecoration = "normal"		//set to: 'normal', or 'underline'
	dqm__fontweight = "normal"		//set to: 'normal', or 'bold'
	dqm__fontstyle = "normal"		//set to: 'normal', or 'italic' 	
    //Rollover font settings
	dqm__hl_textcolor = "#FFFFFF"
	dqm__hl_textdecoration = "normal"	//set to: 'normal', or 'underline'
	//Margins and text alignment
	dqm__text_alignment = "left"		//set to: 'left', 'center' or 'right'
	dqm__margin_top = 2
	dqm__margin_bottom = 2
	dqm__margin_left = 4
	dqm__margin_right = 2

/*-------------------------------------------
Internet Explorer Transition Effects
--------------------------------------------*/
    //Options include - none | fade | pixelate |iris | slide | gradientwipe | checkerboard | radialwipe | randombars | randomdissolve |stretch
	dqm__sub_menu_effect = "fade"
	dqm__sub_item_effect = "fade"
    //Define the effect duration in seconds below.
   	dqm__sub_menu_effect_duration = .3
	dqm__sub_item_effect_duration = 0
    //Specific settings for various transitions.
	dqm__effect_pixelate_maxsqare = 25
	dqm__effect_iris_irisstyle = "CIRCLE"		//CROSS, CIRCLE, PLUS, SQUARE, or STAR
	dqm__effect_checkerboard_squaresx = 14
	dqm__effect_checkerboard_squaresY = 14
	dqm__effect_checkerboard_direction = "RIGHT"	//UP, DOWN, LEFT, RIGHT
    //Opacity and drop shadows.
	dqm__sub_menu_opacity = 100			//1 to 100
	dqm__dropshadow_color = "none"			//Hex color value or 'none'
	dqm__dropshadow_offx = 2			//drop shadow width
	dqm__dropshadow_offy = 2			//drop shadow height
/*-------------------------------------------
Browser Bug fixes and Workarounds
--------------------------------------------*/
    //Mac offset fixes, adjust until sub menus position correctly.
   	dqm__ie4mac_offset_X = -8
	dqm__ie4mac_offset_Y = -65
    //Netscape 4 resize bug workaround.
	dqm__nn4_reaload_after_resize = true
	dqm__nn4_resize_prompt_user = false
	dqm__nn4_resize_prompt_message = "To reinitialize the navigation menu please click the 'Reload' button."
    //Set to true if the menu is the only item on the HTML page.
	dqm__use_opera_div_detect_fix = false
    //Pre-defined sub menu item heights for the Espial Escape browser.
	dqm__escape_item_height = 20
	dqm__escape_item_height0_0 = 70
	dqm__escape_item_height0_1 = 70
/*---------------------------------------------
Exposed menu events
----------------------------------------------*/
    //Reference additional onload statements here.
	//dqm__onload_code = "alert('custom function - onload')"
    //The 'X' indicates the index number of the sub menu group or item.
	dqm__showmenu_codeX = "status = 'custom show menu function call - menu0'"
	dqm__hidemenu_codeX = "status = 'custom hide menu function call - menu0'"
	dqm__clickitem_codeX_X = "alert('custom Function - Menu Item 0_0')"
/*---------------------------------------------
Specific Sub Menu Settings
----------------------------------------------*/
    //The following settings may be defined for specific sub menu groups.
    //The 'X' represents the index number of the sub menu group.
	//dqm__border_widthX = 10;
	//dqm__divider_heightX = 5;		
	//dqm__border_colorX = "#0000ff";     
	//dqm__menu_bgcolor0_1 = "#536895"
	//dqm__hl_bgcolor0_1 = "#666666"
	//dqm__hl_textcolorX = "#ff0000"
	//dqm__text_alignmentX = "left"

    //The following settings may be defined for specific sub menu items.
    //The 'X' represents the index number of the sub menu item.
	dqm__hl_subdescX = "custom highlight text"
	dqm__urltargetX = "_new"

// Sub Menu Structure and Text

    //Home
	dqm__rollover_image0 = "images/nav_home.gif"
	dqm__rollover_wh0 = "105,50"
	dqm__url0 = "http://www.library.ucla.edu/bruinsuccess/";
   	dqm__status_text0 = "Home"

	dqm__sub_xy0 = "-105,50"
	dqm__sub_menu_width0 = 323
	dqm__border_color0 = "#000000"		//Hex color or 'transparent'
	dqm__menu_bgcolor0 = "#FFFFFF"		//Hex color or 'transparent'
	dqm__hl_bgcolor0 = "#666666"
	dqm__textcolor0 = "#000000"	
	dqm__hl_textcolor0 = "#FFFFFF"	

	dqm__subdesc0_0 = "1. Intellectual Property"
	dqm__url0_0 = "../01/01.cfm"
	dqm__status_text0_0 = "Intellectual Property"

	dqm__subdesc0_1 = "2. Need a File, Share a File"
	dqm__url0_1 = "../02/01.cfm"
	dqm__status_text0_1 = "Need a File, Share a File"
	
	dqm__subdesc0_2 = "3. Citing and Documenting Sources"
	dqm__url0_2 = "../03/01.cfm"
	dqm__status_text0_2 = "Citing and Documenting Sources"

	dqm__subdesc0_3 = "4. Avoiding Disaster"
	dqm__url0_3 = "../04/01.cfm"
	dqm__status_text0_3 = "Avoiding Disaster"

	dqm__subdesc0_4 = "5. Don't Get Busted"
	dqm__url0_4 = "../05/01.cfm"
	dqm__status_text0_4 = "Don't Get Busted"


	//Intellectual Property
	dqm__rollover_image1 = "../images/nav_01.gif"
	dqm__rollover_wh1 = "105,50"
	dqm__url1 = "../01/01.cfm";
   	dqm__status_text1 = "Intellectual Property"	

	dqm__sub_xy1 = "-105,50"
	dqm__sub_menu_width1 = 324
	dqm__border_color1 = "#F0DCAE"		//Hex color or 'transparent'
	dqm__menu_bgcolor1 = "#6D2842"		//Hex color or 'transparent'
	dqm__hl_bgcolor1 = "#FF602D"
	dqm__hl_textcolor1 = "#6D2842"	

	dqm__subdesc1_0 = "1. Intellectual Property Law: Why Should I Care?"
	dqm__url1_0 = "../01/01.cfm"
	dqm__status_text1_0 = "Intellectual Property Law: Why Should I Care?"

	dqm__subdesc1_1 = "2. What Does This Mean to You?"
	dqm__url1_1 = "../01/02.cfm"
	dqm__status_text1_1 = "What Does This Mean to You?"

	dqm__subdesc1_2 = "3. You and Copyright: The Basics"
	dqm__url1_2 = "../01/03.cfm"
	dqm__status_text1_2 = "You and Copyright: The Basics"
		
	dqm__subdesc1_3 = "4. Copyright: You as Creator"
	dqm__url1_3 = "../01/04.cfm"
	dqm__status_text1_3 = "Copyright: You as Creator"

	dqm__subdesc1_4 = "5. What If..."
	dqm__url1_4 = "../01/05.cfm"
	dqm__status_text1_4 = "What If..."

	dqm__subdesc1_5 = "6. Copyright: You as Consumer"
	dqm__url1_5 = "../01/06.cfm"
	dqm__status_text1_5 = "Copyright: You as Consumer"

	dqm__subdesc1_6 = "7. Fair Use"
	dqm__url1_6 = "../01/07.cfm"
	dqm__status_text1_6 = "Fair Use"

	dqm__subdesc1_7 = "8. Patents"
	dqm__url1_7 = "../01/08.cfm"
	dqm__status_text1_7 = "Patents"

	dqm__subdesc1_8 = "9. Patents and You"
	dqm__url1_8 = "../01/09.cfm"
	dqm__status_text1_8 = "Patents and You"

	dqm__subdesc1_9 = "10. Trademarks"
	dqm__url1_9 = "../01/10.cfm"
	dqm__status_text1_9 = "Trademarks"

	dqm__subdesc1_10 = "11. Bruin Bragging Rights"
	dqm__url1_10 = "../01/1001.cfm"
	dqm__status_text1_10 = "Bruin Bragging Rights"

	dqm__subdesc1_11 = "12. Quiz Time"
	dqm__url1_11 = "../01/1101.cfm"
	dqm__status_text1_11 = "Quiz Time"

	dqm__subdesc1_12 = "13. What Did Carlos and Eddie Learn?"
	dqm__url1_12 = "../01/12.cfm"
	dqm__status_text1_12 = "What Did Carlos and Eddie Learn?"

	dqm__subdesc1_13 = "14. Explore More"
	dqm__url1_13 = "../01/13.cfm"
	dqm__status_text1_13 = "Explore More"

	dqm__subdesc1_14 = "15. Send Us Feedback"
	dqm__url1_14 = "../about/feedback.cfm"
	dqm__status_text1_14 = "Send Us Feedback"


	//Need a File, Share a File
	dqm__rollover_image2 = "../images/nav_02.gif"
	dqm__rollover_wh2 = "105,50"
	dqm__url2 = "../02/01.cfm";
   	dqm__status_text2 = "Need a File, Share a File"	

	dqm__sub_xy2 = "-105,50"
	dqm__sub_menu_width2 = 324
	dqm__border_color2 = "#CAD9E5"		//Hex color or 'transparent'
	dqm__menu_bgcolor2 = "#00418D"		//Hex color or 'transparent'
	dqm__hl_bgcolor2 = "#8FA9E6"
	dqm__hl_textcolor2 = "#00418D"

	dqm__subdesc2_0 = "1. Need a File, Share a File"
	dqm__url2_0 = "../02/01.cfm"
	dqm__status_text2_0 = "Need a File, Share a File"

	dqm__subdesc2_1 = "2. Students Getting Sued?"
	dqm__url2_1 = "../02/02.cfm"
	dqm__status_text2_1 = "Students Getting Sued?"

	dqm__subdesc2_2 = "3. Student Comments on the News"
	dqm__url2_2 = "../02/03.cfm"
	dqm__status_text2_2 = "Student Comments on the News"
		
	dqm__subdesc2_3 = "4. Copyright Law and File Sharing"
	dqm__url2_3 = "../02/04.cfm"
	dqm__status_text2_3 = "Copyright Law and File Sharing"

	dqm__subdesc2_4 = "5. Urban Myths of Copyright Violations"
	dqm__url2_4 = "../02/0401.cfm"
	dqm__status_text2_4 = "Urban Myths of Copyright Violations"

	dqm__subdesc2_5 = "6. File Sharing in the Dorms"
	dqm__url2_5 = "../02/05.cfm"
	dqm__status_text2_5 = "File Sharing in the Dorms"

	dqm__subdesc2_6 = "7. Where Does UCLA Stand?"
	dqm__url2_6 = "../02/06.cfm"
	dqm__status_text2_6 = "Where Does UCLA Stand?"

	dqm__subdesc2_7 = "8. Fact or Fiction?"
	dqm__url2_7 = "../02/0701.cfm"
	dqm__status_text2_7 = "Fact or Fiction?"

	dqm__subdesc2_8 = "9. What did Carlos and Eddie learn?"
	dqm__url2_8 = "../02/08.cfm"
	dqm__status_text2_8 = "What did Carlos and Eddie learn?"

	dqm__subdesc2_9 = "10. Explore More"
	dqm__url2_9 = "../02/09.cfm"
	dqm__status_text2_9 = "Explore More"

	dqm__subdesc2_10 = "12. Send Us Feedback"
	dqm__url2_10 = "../about/feedback.cfm"
	dqm__status_text2_10 = "Send Us Feedback"
	
	

	//Citing and Documenting Sources
	dqm__rollover_image3 = "../images/nav_03.gif"
	dqm__rollover_wh3 = "105,50"
	dqm__url3 = "../03/01.cfm";
   	dqm__status_text3 = "Citing and Documenting Sources"	

	dqm__sub_xy3 = "-105,50"
	dqm__sub_menu_width3 = 324
	dqm__border_color3 = "#DEE5CA"		//Hex color or 'transparent'
	dqm__menu_bgcolor3 = "#638E00"		//Hex color or 'transparent'
	dqm__hl_bgcolor3 = "#B5C752"
	dqm__hl_textcolor3 = "#003300"

	dqm__subdesc3_0 = "1. Oops, I Plagiarized"
	dqm__url3_0 = "../03/01.cfm"
	dqm__status_text3_0 = "Oops, I Plagiarized"
	
	dqm__subdesc3_1 = "2. Why Cite?"
	dqm__url3_1 = "../03/02.cfm"
	dqm__status_text3_1 = "Why Cite?"
	
	dqm__subdesc3_2 = "3. What to Cite"
	dqm__url3_2 = "../03/03.cfm"
	dqm__status_text3_2 = "What to Cite"
	
	dqm__subdesc3_3 = "4. How to Cite: Choosing a Style"
	dqm__url3_3 = "../03/04.cfm"
	dqm__status_text3_3 = "How to Cite: Choosing a Style"
	
	dqm__subdesc3_4 = "5. How to Cite: In the Text and at the End"
	dqm__url3_4 = "../03/05.cfm"
	dqm__status_text3_4 = "How to Cite: In the Text and at the End"
	
	dqm__subdesc3_5 = "6. Works Cited and Reference Lists: The Basics"
	dqm__url3_5 = "../03/06.cfm"
	dqm__status_text3_5 = "Works Cited and Reference Lists: The Basics"
	
	dqm__subdesc3_6 = "7. Cite as You Write: In-Text Citation Basics"
	dqm__url3_6 = "../03/07.cfm"
	dqm__status_text3_6 = "Cite as You Write: In-Text Citation Basics"
	
	dqm__subdesc3_7 = "8. Quoting, Summarizing and Paraphrasing in a Nutshell"
	dqm__url3_7 = "../03/08.cfm"
	dqm__status_text3_7 = "Quoting, Summarizing and Paraphrasing in a Nutshell"
	
	dqm__subdesc3_8 = "9. Tips on Quoting"
	dqm__url3_8 = "../03/09.cfm"
	dqm__status_text3_8 = "Tips on Quoting"
	
	dqm__subdesc3_9 = "10. Tips on Summarizing"
	dqm__url3_9 = "../03/10.cfm"
	dqm__status_text3_9 = "Tips on Summarizing"
	
	dqm__subdesc3_10 = "11. Tips on Paraphrasing"
	dqm__url3_10 = "../03/11.cfm"
	dqm__status_text3_10 = "Tips on Paraphrasing"
	
	dqm__subdesc3_11 = "12. Oops, I Thought Your Words Were Mine: Taking Notes"
	dqm__url3_11 = "../03/12.cfm"
	dqm__status_text3_11 = "Oops, I Thought Your Words Were Mine: Taking Notes"
	
	dqm__subdesc3_12 = "13. Working with Friends"
	dqm__url3_12 = "../03/13.cfm"
	dqm__status_text3_12 = "Working with Friends"
	
	dqm__subdesc3_13 = "14. What Did Eddie Learn?"
	dqm__url3_13 = "../03/14.cfm"
	dqm__status_text3_13 = "What Did Eddie Learn?"
	
	dqm__subdesc3_14 = "15. Quiz Yourself!"
	dqm__url3_14 = "../03/15.cfm"
	dqm__status_text3_14 = "Quiz Yourself!"
	
	dqm__subdesc3_15 = "16. Printable Citation Guides"
	dqm__url3_15 = "../06/06.cfm"
	dqm__status_text3_15 = "Printable Citation Guides"
	
	dqm__subdesc3_16 = "17. Send Us Feedback"
	dqm__url3_16 = "../about/feedback.cfm"
	dqm__status_text3_16 = "Send Us Feedback"




	//Avoiding Disaster
	dqm__rollover_image4 = "../images/nav_04.gif"
	dqm__rollover_wh4 = "105,50"
	dqm__url4 = "../04/01.cfm";
   	dqm__status_text4 = "Avoiding Disaster"	

	dqm__sub_xy4 = "-215,50"
	dqm__sub_menu_width4 = 325
	dqm__border_color4 = "#E8DACC"		//Hex color or 'transparent'
	dqm__menu_bgcolor4 = "#5A3400"		//Hex color or 'transparent'
	dqm__hl_bgcolor4 = "#8C5531"
	dqm__hl_textcolor4 = "#000000"
	
	dqm__subdesc4_0	 = 	"1. Avoiding Disaster: Eddie Gets Organized"
	dqm__url4_0	 = 	"../04/	01.cfm"	
	dqm__status_text4_0 = "Avoiding Disaster: Eddie Gets Organized"

	dqm__subdesc4_1 = "2. Tips for Making Research A Little Less Painful"
	dqm__url4_1 = "../04/02.cfm"
	dqm__status_text4_1 = "Tips for Making Research A Little Less Painful"

	dqm__subdesc4_2 = "3. What Are You Looking At?"
	dqm__url4_2 = "../04/03.cfm"
	dqm__status_text4_2 = "What Are You Looking At?"

	dqm__subdesc4_3 = "4. Email Citations to Yourself"
	dqm__url4_3 = "../04/04.cfm"
	dqm__status_text4_3 = "Email Citations to Yourself"

	dqm__subdesc4_4 = "5. Taking Notes"
	dqm__url4_4 = "../04/05.cfm"
	dqm__status_text4_4 = "Taking Notes"

	dqm__subdesc4_5 = "6. Keep Track of Searches"
	dqm__url4_5 = "../04/06.cfm"
	dqm__status_text4_5 = "Keep Track of Searches"

	dqm__subdesc4_6 = "7. Keep Things in One Place"
	dqm__url4_6 = "../04/07.cfm"
	dqm__status_text4_6 = "Keep Things in One Place"

	dqm__subdesc4_7 = "8. Why Print Web Pages?"
	dqm__url4_7 = "../04/08.cfm"
	dqm__status_text4_7 = "Why Print Web Pages?"

	dqm__subdesc4_8 = "9. Time and Project Management"
	dqm__url4_8 = "../04/09.cfm"
	dqm__status_text4_8 = "Time and Project Management"

	dqm__subdesc4_9 = "10. Planning and Timing"
	dqm__url4_9 = "../04/10.cfm"
	dqm__status_text4_9 = "Planning and Timing"

	dqm__subdesc4_10 = "11. Keeping Things On Track"
	dqm__url4_10 = "../04/11.cfm"
	dqm__status_text4_10 = "Keeping Things On Track"

	dqm__subdesc4_11 = "12. Resources on Campus"
	dqm__url4_11 = "../04/12.cfm"
	dqm__status_text4_11 = "Resources on Campus"

	dqm__subdesc4_12 = "13. What Was That Again?"
	dqm__url4_12 = "../04/13.cfm"
	dqm__status_text4_12 = "What Was That Again?"

	dqm__subdesc4_13 = "14. Gotta Tip?"
	dqm__url4_13 = "../04/14.cfm"
	dqm__status_text4_13 = "Gotta Tip?"

	dqm__subdesc4_14 = "15. Tips from Students"
	dqm__url4_14 = "../04/15.cfm"
	dqm__status_text4_14 = "Tips from Students"

	dqm__subdesc4_15 = "16. Send Us Your Tips"
	dqm__url4_15 = "../04/tip_form.cfm"
	dqm__status_text4_15 = "Send Us Your Tips"

	dqm__subdesc4_16 = "17. Send Us Feedback"
	dqm__url4_16 = "../about/feedback.cfm"
	dqm__status_text4_16 = "Send Us Feedback"




	//Don't Get Busted	
	dqm__rollover_image5 = "../images/nav_05.gif"
	dqm__rollover_wh5 = "105,50"
	dqm__url5 = "../05/01.cfm";
   	dqm__status_text5 = "Don't Get Busted"	

	dqm__sub_xy5 = "-324,50"
	dqm__sub_menu_width5 = 325
	dqm__border_color5 = "#D5E8CC"		//Hex color or 'transparent'
	dqm__menu_bgcolor5 = "#334400"		//Hex color or 'transparent'
	dqm__hl_bgcolor5 = "#CEB273"
	dqm__hl_textcolor5 = "#000000"

	dqm__subdesc5_0 = "1. UCLA Policy and Academic Integrity"
	dqm__url5_0 = "../05/01.cfm"
	dqm__status_text5_0 = "UCLA Policy and Academic Integrity"

	dqm__subdesc5_1 = "2. Where Do You Stand?"
	dqm__url5_1 = "../05/02.cfm"
	dqm__status_text5_1 = "Where Do You Stand?"

	dqm__subdesc5_2 = "3. Academic Integrity and UCLA Policies"
	dqm__url5_2 = "../05/03.cfm"
	dqm__status_text5_2 = "Academic Integrity and UCLA Policies"

	dqm__subdesc5_3 = "4. Things You Don't Want to Do"
	dqm__url5_3 = "../05/04.cfm"
	dqm__status_text5_3 = "Things You Don't Want to Do"

	dqm__subdesc5_4 = "5. Strategies from the Deans"
	dqm__url5_4 = "../05/05.cfm"
	dqm__status_text5_4 = "Strategies from the Deans"

	dqm__subdesc5_5 = "6. Consequences"
	dqm__url5_5 = "../05/06.cfm"
	dqm__status_text5_5 = "Consequences"

	dqm__subdesc5_6 = "7. Decisions, Decisions..."
	dqm__url5_6 = "../05/0701.cfm"
	dqm__status_text5_6 = "Decisions, Decisions..."

	dqm__subdesc5_7 = "8. Things to Do and Things to Avoid"
	dqm__url5_7 = "../05/08.cfm"
	dqm__status_text5_7 = "Things to Do and Things to Avoid"

	dqm__subdesc5_8 = "9. Explore More"
	dqm__url5_8 = "../05/09.cfm"
	dqm__status_text5_8 = "Explore More"

	dqm__subdesc5_9 = "10. Send Us Feedback"
	dqm__url5_9 = "../about/feedback.cfm"
	dqm__status_text5_9 = "Send Us Feedback"




