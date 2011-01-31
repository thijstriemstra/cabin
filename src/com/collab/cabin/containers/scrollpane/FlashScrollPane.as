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
package com.collab.cabin.containers.scrollpane
{
	import com.collab.cabin.log.Logger;
	import com.collab.cabin.util.ClassUtils;
	import com.collab.cabin.util.StringUtil;
	
	import fl.containers.ScrollPane;
	import fl.controls.ScrollBarDirection;
	import fl.controls.ScrollPolicy;
	import fl.events.ScrollEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * Custom <code>fl.containers.ScrollPane</code> with a <code>children</code> list.
	 * 
	 * @see fl.containers.ScrollPane ScrollPane
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class FlashScrollPane extends ScrollPane
	{
		// ====================================
		// PRIVATE VARS
		// ====================================
		
		private var _children		: Array;
		
		// ====================================
		// GETTER/SETTER
		// ====================================
		
		[Inspectable(type="Array", defaultValue="[]")]
		/**
		 * The panel's children.
		 * 
		 * @return 
		 */		
		public function get children():Array
		{
			return _children;
		}
		public function set children( val:Array ):void
		{
			_children = val;
		}
		
		/**
		 * Constructor. 
		 *  
		 * @param width
		 * @param height
		 */		
		public function FlashScrollPane( width:int=100, height:int=100 )
		{
			super();
			
			_children = [];
			
			// XXX: not sure about this clashing
			//name = getQualifiedClassName( this );
			scrollDrag = false;
			horizontalScrollPolicy = ScrollPolicy.ON;
			verticalScrollPolicy = ScrollPolicy.OFF;
			source = new Sprite();
			setSize( width, height );
			
			// listen for events
			addEventListener( Event.COMPLETE, onLoadComplete, false, 0, true );
			addEventListener( ScrollEvent.SCROLL, onScroll, false, 0, true );
		}
		
		// ====================================
		// PUBLIC METHODS
		// ====================================
		
		/**
		 * @private 
		 */		
		override public function update():void
		{
			layoutChildren();
			
			super.update();
		}
		
		/**
		 * Layout children.
		 * 
		 * @private
		 */		
		public function layoutChildren():void
		{
		}
		
		/**
		 * Add specified <code>child</code>.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var pane:FlashScrollPane = new FlashScrollPane();
		 * var shape:Sprite = new Sprite();
		 * 
		 * // add item
		 * var success:Boolean = pane.add( shape );
		 * 
		 * trace( success ); // true
		 * trace( pane.children.length ); // 0</listing>
		 * 
		 * @param child
		 * @return 		Return true if child was added, otherwise false.
		 */		
		public function add( child:DisplayObject ):Boolean
		{
			var result:Boolean = false;
			
			if ( child && source )
			{
				source.addChild( child );
				_children.push( child );
				update();
				result = true;
			}
			
			if ( child )
			{
				var msg:String = StringUtil.replace( "Added %s to %s: %s",
					             ClassUtils.className( child ),
								 ClassUtils.className( this ), result );
				//Logger.debug( msg );
			}
			
			return result;
		}
		
		/**
		 * Remove specified <code>child</code>.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var pane:FlashScrollPane = new FlashScrollPane();
		 * 
		 * var shape:Sprite = new Sprite();
		 * trace( pane.remove( shape )); // false, not added yet
		 * 
		 * pane.add( shape );
		 * trace( pane.remove( shape )); // true</listing>
		 * 
		 * @param child		Display object.
		 * @return 			Return true if child was found and removed,
		 *                  otherwise false.
		 */		
		public function remove( child:DisplayObject ):Boolean
		{
			var result:Boolean = false;
			
			if ( child && source && source.contains( child ))
			{
				var cnt:int = 0;
				
				for ( cnt; cnt<_children.length; cnt++ )
				{
					if ( _children[ cnt ] == child )
					{
						_children.splice( cnt, 1 );
						break;
					}
				}
				
				source.removeChild( child );
				result = true;
				update();
			}
			
			if ( child )
			{
				var msg:String = StringUtil.replace( "Removed %s from %s: %s",
								 ClassUtils.className( child ),
								 ClassUtils.className( this ), result );
				//Logger.debug( msg );
			}
			
			return result;
		}
		
		/**
		 * Remove child at specified <code>index</code>.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var pane:FlashScrollPane = new FlashScrollPane();
		 * 
		 * var shape:Sprite = new Sprite();
		 * trace( pane.removeAt( 1 )); // false, item doesn't exist
		 * 
		 * // add two children
		 * pane.add( shape );
		 * pane.add( shape );
		 * 
		 * trace( pane.removeAt( 1 )); // true</listing>
		 * 
		 * @param index
		 * @return 		Boolean indicating if the item was removed or not.
		 */		
		public function removeAt( index:int ):Boolean
		{
			var result:Boolean = false;
			
			try
			{
				var child:DisplayObject = _children[ index ];
				result = remove( child );
			}
			catch ( e:Error )
			{
			}
			
			return result;
		}
		
		/**
		 * Remove all children.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var pane:FlashScrollPane = new FlashScrollPane();
		 * var shape:Sprite = new Sprite();
		 * 
		 * // add two children
		 * pane.add( shape );
		 * pane.add( shape );
		 * 
		 * trace( pane.removeAll() ); // true
		 * trace( pane.children.length ); // 0</listing>
		 * 
		 * @return Boolean indicating if the items were removed or not.
		 */		
		public function removeAll():Boolean
		{
			var result:Boolean = false;
			
			if ( _children && _children.length > 0 )
			{
				var child:*;
				
				// remove existing children
				for each ( child in _children )
				{
					remove( child );
				}
				
				_children = [];
				result = true;
			}
			
			return result;
		}
		
		// ====================================
		// EVENT HANDLERS
		// ====================================
		
		/**
		 * @private
		 * @param event
		 */		
		protected function onLoadComplete( event:Event ):void
		{
			//trace( "ScrollPane Load complete" );
		}
		
		/**
		 * @private
		 * @param arg0
		 */		
		override protected function keyUpHandler( arg0:KeyboardEvent ):void
		{
			super.keyUpHandler( arg0 );
		}
		
		/**
		 * @private
		 * @param arg0
		 */		
		override protected function keyDownHandler( arg0:KeyboardEvent ):void
		{
			super.keyDownHandler( arg0 );
		}
		
		/**
		 * @param event
		 * @private
		 */		
		protected function onScroll( event:ScrollEvent ):void
		{
			switch ( event.direction )
			{
				case ScrollBarDirection.HORIZONTAL:
					//trace( "horizontal scroll: " +  event.position + " of " +
					//			  event.currentTarget.maxHorizontalScrollPosition);
					break;
				
				case ScrollBarDirection.VERTICAL:
					// HACK: to prevent vertical scrolling with keyboard
					if ( verticalScrollPolicy == ScrollPolicy.OFF )
					{
						verticalScrollPosition = 0;
					}
					else
					{
						//trace( "vertical scroll: " + event.position + " of " +
						//		event.currentTarget.maxVerticalScrollPosition );
					}
					break;
			}
		}
		
	}
}