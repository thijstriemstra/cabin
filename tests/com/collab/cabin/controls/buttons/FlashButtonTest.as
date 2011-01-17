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
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.notNullValue;
	
	public class FlashButtonTest
	{		
		private var btn	: FlashButton;
		
		[Before(async,ui)]
		public function setUp():void
		{
			btn = new FlashButton();
			
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
		public function testGet_disabledTextFormat():void
		{
			assertThat( btn.disabledTextFormat, notNullValue() );
		}
		
		[Test]
		public function testGet_textFormat():void
		{
			assertThat( btn.disabledTextFormat, notNullValue() );
		}
	}
}