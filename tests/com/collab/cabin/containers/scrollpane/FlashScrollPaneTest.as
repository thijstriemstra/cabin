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
package com.collab.cabin.containers.scrollpane
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.collection.emptyArray;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasProperties;
	
	public class FlashScrollPaneTest
	{		
		private var pane	: FlashScrollPane;
		
		[Before(async,ui)]
		public function setUp():void
		{
			pane = new FlashScrollPane();
			
			Async.proceedOnEvent( this, pane, Event.ADDED, 100 );
			UIImpersonator.addChild( pane );
		}
		
		[After(async,ui)]
		public function tearDown():void
		{
			UIImpersonator.removeChild( pane );
			pane = null;
		}
		
		[Test]
		public function dimensions():void
		{
			assertThat( pane, hasProperties({
				width: 100,
				height: 100
			}));
		}
		
		[Test]
		public function testAdd():void
		{
			var shape:Sprite = new Sprite();
			var result:Boolean = pane.add( shape );
			
			assertThat( result, equalTo( true ));
			assertThat( pane.children, arrayWithSize( 1 ));
		}
		
		[Test]
		public function testGet_children():void
		{
			assertThat( pane.children, emptyArray() );
		}
		
		[Test]
		public function testSet_children():void
		{
			var children:Array = [];
			var shape:Sprite;
			var cnt:int = 0;
			
			for ( cnt; cnt<10; cnt++ )
			{
				shape = new Sprite();
				children.push( shape );
			}
			
			pane.children = children;
			assertThat( pane.children, arrayWithSize( 10 ));
			
			pane.children = pane.children.slice(0, 5);
			assertThat( pane.children, arrayWithSize( 5 ));
		}
		
		[Test]
		public function testLayoutChildren():void
		{
			pane.layoutChildren();
			assertThat( pane.children, emptyArray() );
		}
		
		[Test]
		public function testUpdate():void
		{
			pane.update();
			assertThat( pane.children, emptyArray() );
		}
		
		[Test]
		public function testRemove():void
		{
			var shape:Sprite = new Sprite();
			var removed:Boolean = pane.remove( shape );
			
			assertThat( removed, equalTo( false ));
			assertThat( pane.children, emptyArray() );
			
			pane.add( shape );
			assertThat( pane.children, arrayWithSize( 1 ));
			
			removed = pane.remove( shape );
			assertThat( pane.children, emptyArray() );
			assertThat( removed, equalTo( true ));
		}
		
		[Test]
		public function testRemoveAt():void
		{
			var shape:Sprite = new Sprite();
			var removed:Boolean = pane.removeAt( 1 );
			
			assertThat( removed, equalTo( false ));
			assertThat( pane.children, emptyArray() );
			
			pane.add( shape );
			pane.add( shape );
			pane.add( shape );
			assertThat( pane.children, arrayWithSize( 3 ));
			
			removed = pane.removeAt( 1 );
			assertThat( removed, equalTo( true ));
			assertThat( pane.children, arrayWithSize( 2 ));
		}
		
		[Test]
		public function testRemoveAll():void
		{
			var shape:Sprite = new Sprite();
			var removed:Boolean = pane.removeAll();
			
			assertThat( removed, equalTo( false ));
			
			pane.add( shape );
			pane.add( shape );
			pane.add( shape );
			assertThat( pane.children, arrayWithSize( 3 ));
			
			removed = pane.removeAll();
			assertThat( removed, equalTo( true ));
			assertThat( pane.children, emptyArray() );
		}

	}
}