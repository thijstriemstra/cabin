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
package com.collab.cabin.controls
{
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	
	public class MenuTest
	{		
		private var menu	: Menu;
		
		[Before(async,ui)]
		public function setUp():void
		{
			menu = new Menu();
			
			Async.proceedOnEvent( this, menu, Event.ADDED, 100 );
			UIImpersonator.addChild( menu );
		}
		
		[After(async,ui)]
		public function tearDown():void
		{
			UIImpersonator.removeChild( menu );
			menu = null;
		}
		
		[Test]
		public function testGet_dataProvider():void
		{
			assertThat( menu.items, nullValue() );
		}
		
		[Test]
		public function testSet_dataProvider():void
		{
			menu.dataProvider = [1, 2, 3];
			assertThat( menu.dataProvider, arrayWithSize( 3 ));
			
			menu.dataProvider = [4, 5];
			assertThat( menu.dataProvider, arrayWithSize( 2 ));
		}
		
		[Test]
		public function testGet_direction():void
		{
			assertThat( menu.direction, equalTo( "vertical" ));
		}
		
		[Test]
		public function testGet_horizontalGap():void
		{
			assertThat( menu.horizontalGap, equalTo( 0 ));
		}
		
		[Test]
		public function testSet_horizontalGap():void
		{
			menu.horizontalGap = 10;
			assertThat( menu.horizontalGap, equalTo( 10 ));
		}
		
		[Test]
		public function testGet_selectedIndex():void
		{
			assertThat( menu.selectedIndex, equalTo( -1 ));
		}
		
		[Test]
		public function testGet_selectedItem():void
		{
			assertThat( menu.selectedItem, nullValue() );
		}
		
		[Test]
		public function testGet_verticalGap():void
		{
			assertThat( menu.verticalGap, equalTo( 0 ));
		}
	}
}