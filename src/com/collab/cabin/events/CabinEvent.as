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
package com.collab.cabin.events
{
	import flash.events.Event;
	
	/**
	 * The CabinEvent class represents the event object passed to the event
     * listener for many Cabin events.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class CabinEvent extends Event
	{
		// ====================================
		// CONSTANTS
		// ====================================
		
		/**
		 * Dispatched when the creation of a view has completed.
		 */		
		public static const CREATION_COMPLETE	: String = "creationComplete";
		
		/**
		 * 
		 */		
		public static const PREINITIALIZE		: String = "preInitialize";
		
		/**
		 * Dispatched when a view is closed. 
		 */		
		public static const CLOSE_VIEW			: String = "closeView";
		
		/**
		 * Constructor.
		 *  
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 */		
		public function CabinEvent( type:String, bubbles:Boolean=false,
								   cancelable:Boolean=false )
		{
			super( type, bubbles, cancelable );
		}
		
	}
}