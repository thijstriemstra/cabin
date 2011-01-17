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
package com.collab.cabin.controls.buttons
{
	import com.collab.cabin.display.util.StyleDict;
	
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.text.emptyString;
	
	public class LabelButtonTest
	{		
		private var btn	: LabelButton;
		
		[Before(async,ui)]
		public function setUp():void
		{
			btn = new LabelButton();
			
			Async.proceedOnEvent( this, btn, Event.ADDED, 100 );
			UIImpersonator.addChild( btn );
		}
		
		[After(async,ui)]
		public function tearDown():void
		{
			UIImpersonator.removeChild( btn );
			btn = null;
		}
		
		[Test]
		public function testSet_backgroundColor():void
		{
			btn.backgroundColor = StyleDict.WHITE;
			assertThat( btn.backgroundColor, equalTo( StyleDict.WHITE ));
		}
		
		[Test]
		public function testGet_backgroundColor():void
		{
			assertThat( btn.backgroundColor, equalTo( StyleDict.BLACK ));
		}
		
		[Test]
		public function testGet_enabled():void
		{
			assertThat( btn.enabled, equalTo( true ));
		}
		
		[Test]
		public function testSet_enabled():void
		{
			btn.enabled = false;
			assertThat( btn.enabled, equalTo( false ));
			
			btn.enabled = true;
			assertThat( btn.enabled, equalTo( true ));
		}
		
		[Test]
		public function testGet_label():void
		{
			assertThat( btn.label, emptyString() );
		}
		
		[Test]
		public function testSet_label():void
		{
			btn.label = "Jython";
			assertThat( btn.label, equalTo( "Jython" ));
		}
		
		[Test]
		public function testGet_textColor():void
		{
			assertThat( btn.textColor, equalTo( StyleDict.WHITE ));
		}
		
		[Test]
		public function testSet_textColor():void
		{
			btn.textColor = StyleDict.RED1;
			assertThat( btn.textColor, equalTo( StyleDict.RED1 ));
		}
		
		[Test]
		public function testGet_viewHeight():void
		{
			assertThat( btn.viewHeight, equalTo( 0 ));
		}
		
		[Test]
		public function testGet_viewWidth():void
		{
			assertThat( btn.viewWidth, equalTo( 0 ));
		}
	}
}