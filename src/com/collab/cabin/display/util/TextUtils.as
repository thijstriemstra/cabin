/*
Cabin project.

Copyright (C) 2010-2011 Collab

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
package com.collab.cabin.display.util
{
	import com.collab.cabin.util.StringUtil;
	
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * Text utilities.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class TextUtils
	{
		// ====================================
		// PUBLIC METHODS
		// ====================================
		
		/**
		 * Create styled TextField.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var arial:Font = new Arial();
		 * var tf:TextField = TextUtils.createTextField( arial, "Art of rolling.", 12, 0xFFFFFF );
		 * trace( tf.font ); // Arial
		 * trace( tf.size ); // 12
		 * trace( tf.htmlText ); // Art of rolling.</listing>
		 * 
		 * @param font		Font instance.
		 * @param text		Text to display.
		 * @param size		Text size.
		 * @param color		Text color.
		 * @param ml		Multiline. Either true or false.
		 * @param bold		Font weight.
		 * @param leading	Text leading.
		 * @param align		Text align. One of: 'left', 'right', 'center'.
		 * @return 			New styled TextField instance.
		 */		
		public static function createTextField( font:Font=null, text:String="", size:Number=15,
												color:uint=0x000000, ml:Boolean=false,
												bold:Boolean=false, leading:Number=0,
												align:String="left" ) : TextField
		{
			return createStyledTextField( font, text, size, color, ml,
									      bold, leading, align );
		}
		
		/**
		 * Create TextFormat with standard font.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var arial:Font = new Arial();
		 * var fmt:TextFormat = TextUtils.createTextFormat( arial, 12, 0xFFFFFF );
		 * trace( fmt.font ); // Arial
		 * trace( fmt.size ); // 12
		 * trace( fmt.bold ); // false</listing>
		 * 
		 * @param font		Font instance.
		 * @param size		Text size.
		 * @param color		Text color.
		 * @param bold		Font weight
		 * @param leading	Text leading.
		 * @param align		Text align. One of: 'left', 'right', 'center'.
		 * @return 
		 */		
		public static function createTextFormat( font:Font=null, size:Number=12,
										  		 color:uint=0x000000,
												 bold:Boolean=false, leading:Number=0,
												 align:String="left" ) : TextFormat
		{
			var format:TextFormat = new TextFormat();
			format.size = size;
			format.align = align;
			format.color = color;
			format.leading = leading;
			format.bold = bold;
			format.kerning = false;
			if ( font)
			{
				format.font = font.fontName;
			}
			
			return format;
		}
		
		/**
		 * Get colorized HTML font tag.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var dog:String = TextUtils.getHTMLFontString( 0xffffff, "Lassie" );
		 * trace( dog ); // &lt;font color='#ffffff'&gt;Lassie&lt;/font'&gt;</listing>
		 * 
		 * @param color
		 * @param text
		 * @return 
		 */		
		public static function getHTMLFontString( color:uint, text:String ):String
		{
			// XXX: move to decorator
			var markup:String = "<font color='#%s'>%s</font>";
			
			return StringUtil.replace( markup, color.toString( 16 ), text );
		}
		
		// ====================================
		// PRIVATE METHODS
		// ====================================
		
		/**
		 * Create a styled text field.
		 * 
		 * @param font
		 * @param text
		 * @param size
		 * @param color
		 * @param ml
		 * @param bold
		 * @param leading
		 * @param align
		 * 
		 * @return A new <code>TextField</code> instance
		 */		
		private static function createStyledTextField( font:Font, text:String="", size:Number=16,
													   color:uint=0x000000, ml:Boolean=false,
													   bold:Boolean=false, leading:Number=0,
													   align:String="center" ) : TextField
		{
			var debug:Boolean = false;
			var format:TextFormat = createTextFormat( font, size, color, bold,
				leading, align );
			var tf:TextField = new TextField();
			
			tf.tabEnabled = false;
			tf.doubleClickEnabled = false;
			tf.mouseEnabled = false;
			tf.mouseWheelEnabled = false;
			tf.selectable = false;
			tf.antiAliasType = AntiAliasType.ADVANCED;
			tf.defaultTextFormat = format;
			tf.background = debug;
			tf.backgroundColor = StyleDict.GREY1;
			tf.textColor = format.color as uint;
			tf.wordWrap = ml;
			tf.border = debug;
			tf.borderColor = StyleDict.RED1;
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.multiline = ml;
			if ( font )
			{
				tf.embedFonts = true;
			}
			
			if ( text )
			{
				tf.htmlText = text;
			}
			
			return tf;
		}
		
	}
}