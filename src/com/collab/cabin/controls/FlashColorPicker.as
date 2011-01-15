/*
Cabin project.

Copyright (C) 2010-2011 Collabollabollab

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
	import com.collab.cabin.core.UIComponent;
	import com.collab.cabin.display.util.TextUtils;
	
	import fl.controls.ColorPicker;
	import fl.events.ColorPickerEvent;
	
	import flash.text.TextField;
	
	/**
	 * Custom Flash color picker.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class FlashColorPicker extends UIComponent
	{
		// ====================================
		// PROTECTED VARS
		// ====================================
		
		/**
		 * Tool for selecting a line color.
		 */		
		protected var colorPicker		: ColorPicker;
		
		/**
		 * Label field. 
		 */		
		protected var labelField		: TextField;
		
		// ====================================
		// PRIVATE VARS
		// ====================================
		
		private var _label				: String;
		
		// ====================================
		// GETTER/SETTER
		// ====================================
		
		/**
		 * @return 
		 */		
		public function get label():String
		{
			return _label;
		}
		public function set label( val:String ):void
		{
			if ( val )
			{
				_label = val;
				invalidate();
			}
		}
		
		/**
		 * Constructor.
		 * 
		 * @param label
		 */		
		public function FlashColorPicker( label:String=null )
		{
			_label = label;
			
			super();
			show();
		}
		
		// ====================================
		// PROTECTED METHODS
		// ====================================
		
		/**
		 * @private 
		 */		
		override protected function draw():void
		{
			// label
			labelField = TextUtils.createTextField( null, _label );
			addChild( labelField );
			
			// color picker
			colorPicker = new ColorPicker();
			colorPicker.addEventListener( ColorPickerEvent.CHANGE, onChangeColor,
										  false, 0, true );
			addChild( colorPicker );
		}

		/**
		 * @private 
		 */		
		override protected function layout():void
		{
			// label
			labelField.x = 0
			labelField.y = 5;
			
			// color picker
			colorPicker.x = labelField.x + labelField.width + 5;
			colorPicker.y = 0;
		}
		
		/**
		 * @private 
		 */		
		override protected function invalidate():void
		{
			removeChildFromDisplayList( colorPicker );
			removeChildFromDisplayList( labelField );
			
			super.invalidate();
		}
		
		// ====================================
		// EVENT HANDLERS
		// ====================================
		
		/**
		 * @param event
		 */		
		protected function onChangeColor( event:ColorPickerEvent ):void
		{
			event.stopImmediatePropagation();
		}
		
	}
}