/*
Cabin project.

Copyright (C) 2011 Collab

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
package com.collab.cabin.display
{
	import com.collab.cabin.display.util.StyleDict;
	import com.collab.cabin.display.util.TextUtils;
	
	import flash.events.Event;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasProperties;
	
	public class TextUtilsTest
	{	
		private var fnt:Font;
		private var tf:TextField;
		private var fmt:TextFormat;
		private var txt:String;
		
		[Before]
		public function setUp():void
		{
			fnt = new Font();
		}
		
		[After]
		public function tearDown():void
		{
			fnt = null;
			tf = null;
			fmt = null;
			txt = null;
		}
		
		[Test]
		public function testCreateTextFormat():void
		{
			// default
			fmt = TextUtils.createTextFormat();
			assertThat( fmt, hasProperties({
				size: equalTo( 12 ),
				color: equalTo( 0x000000 ),
				bold: equalTo( false ),
				leading: equalTo( 0 ),
				align: equalTo( "left" )
			}));
			
			// custom
			fmt = TextUtils.createTextFormat( fnt, 14, 0xFFFFFF );
			assertThat( fmt, hasProperties({
				size: equalTo( 14 ),
				color: equalTo( 0xFFFFFF )
			}));
		}
		
		[Test(async,ui)]
		public function testCreateTextField():void
		{
			tf = TextUtils.createTextField( fnt );
			fmt = TextUtils.createTextFormat();

			Async.proceedOnEvent( this, tf, Event.ADDED, 100 );
			UIImpersonator.addChild( tf );
			
			// default
			assertThat( tf, hasProperties({
				tabEnabled: equalTo( false ),
				doubleClickEnabled: equalTo( false ),
				mouseEnabled: equalTo( false ),
				mouseWheelEnabled: equalTo( false ),
				selectable: equalTo( false ),
				antiAliasType: equalTo( AntiAliasType.ADVANCED ),
				background: equalTo( false ),
				backgroundColor: equalTo( StyleDict.GREY1 ),
				wordWrap: equalTo( false ),
				multiline: equalTo( false ),
				embedFonts: equalTo( true ),
				border: equalTo( false ),
				borderColor: equalTo( StyleDict.RED1 ),
				autoSize: equalTo( TextFieldAutoSize.LEFT ),
				htmlText: equalTo( "" ),
				defaultTextFormat:  hasProperties({
					align:  equalTo( "left" ),
					size: equalTo( 15 )
				}),
				textColor: equalTo( 0x000000 )
			}));
			
			UIImpersonator.removeChild( tf );
		}
		
		[Test]
		public function testGetHTMLFontString():void
		{
			txt = TextUtils.getHTMLFontString( 0xffffff, "Tembaco" );
			assertThat( txt, equalTo( "<font color='#ffffff'>Tembaco</font>" ));
			
			txt = TextUtils.getHTMLFontString( 0x000000, "<b>Markup</b>" );
			assertThat( txt, equalTo( "<font color='#0'><b>Markup</b></font>" ));
		}
		
	}
}