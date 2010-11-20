package api.keyboard.notifiers
{
	import api.events.keyboard.notifiers.OnKeyEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.keyboard.notifiers.OnKeyEvent.RESULT
	*/
	[Event(name="result", type="api.events.keyboard.onKey.OnKeyEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_onKey.html Northcode Help Documentation
	*/
	public class OnKey extends Keyboard
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var alt:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var blocked:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var ctrl:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var keycode:String = null;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var shift:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var state:Boolean = false;
		
		/**
		* Constructor for Keyboard.OnKey()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_onKey.html Northcode Help Documentation
		*/
		public function OnKey(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Keyboard.setNotify( {event:"onKey"}
									  ,{callback:actionComplete, errorSTR:"onKeyError", code:"25010"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			
			blocked = convertBinaryToBoolean( Number( __r[ 0 ] ) );
			state = convertBinaryToBoolean( Number( __r[ 1 ] ) );
			keycode = __r[ 2 ];
			alt = convertBinaryToBoolean( Number( __r[ 3 ] ) );
			shift = convertBinaryToBoolean( Number( __r[ 4 ] ) );
			ctrl = convertBinaryToBoolean( Number( __r[ 5 ] ) );
			
			var e : OnKeyEvent = new OnKeyEvent( OnKeyEvent.RESULT );
			e.alt = alt;
			e.blocked = blocked;
			e.ctrl = ctrl;
			e.keycode = keycode;
			e.shift = shift;
			e.state = state;
			dispatchEvent( e );
		}
	}
}