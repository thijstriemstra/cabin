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
package com.collab.cabin.controls.menu
{
	import com.collab.cabin.controls.Menu;
	
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.object.nullValue;
	
	public class MenuItemTest
	{		
		private var item	: MenuItem;
		
		[Before(async,ui)]
		public function setUp():void
		{
			item = new MenuItem();
			
			Async.proceedOnEvent( this, item, Event.ADDED, 100 );
			UIImpersonator.addChild( item );
		}
		
		[After(async,ui)]
		public function tearDown():void
		{
			UIImpersonator.removeChild( item );
			item = null;
		}
		
		[Test]
		public function testGet_buttonHeight():void
		{
			assertThat( item.buttonHeight, equalTo( 0 ));
		}
		
		[Test]
		public function testGet_buttonWidth():void
		{
			assertThat( item.buttonWidth, equalTo( 0 ));
		}
		
		[Test]
		public function testDeselect():void
		{
			item.deselect();
			
			assertThat( item.selected, equalTo( false ));
		}
		
		[Test]
		public function testGet_index():void
		{
			assertThat( item.index, equalTo( 0 ));
		}
		
		[Test]
		public function testGet_menu():void
		{
			assertThat( item.menu, nullValue() );
		}
		
		[Test]
		public function testSet_menu():void
		{
			var menu:Menu = new Menu();
			item.menu = menu;
			
			assertThat( item.menu, notNullValue() );
		}
		
		[Test]
		public function testSelect():void
		{
			item.select();
			
			assertThat( item.selected, equalTo( false ));
		}
		
		[Test]
		public function testGet_selected():void
		{
			assertThat( item.selected, equalTo( false ));
		}
		
		[Test]
		public function testToString():void
		{
			var msg:String = "<MenuItem label='' index='0'/>";
			
			assertThat( item.toString(), equalTo( msg ));
		}
	}
}