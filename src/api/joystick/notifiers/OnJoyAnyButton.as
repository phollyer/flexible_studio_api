package api.joystick.notifiers
{
	import api.events.joystick.notifiers.OnJoyAnyButtonEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.joystick.notifiers.OnJoyAnyButtonEvent.RESULT
	*/
	[Event(name="result", type="api.events.joystick.onJoyAnyButton.OnJoyAnyButtonEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyAnyButton.html Northcode Help Documentation
	*/
	public class OnJoyAnyButton extends Joystick
	{
		// Results
		public var button:Number = -1;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var id:String = null;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var state:Number = 0;
				
		/**
		* Constructor for Joystick.OnJoyAnyButton()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyAnyButton.html Northcode Help Documentation
		*/
		public function OnJoyAnyButton(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyAnyButton"}
									  ,{callback:actionComplete, errorSTR:"onJoyAnyButtonError", code:"24008"} );
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
			id = __r[ 0 ] 
			button = Number( __r[ 1] );
			state = Number( __r[ 2 ] );
			
			var e : OnJoyAnyButtonEvent = new OnJoyAnyButtonEvent( OnJoyAnyButtonEvent.RESULT );
			e.id = id;
			e.button = button;
			e.state = state;
			dispatchEvent( e );
		}
	}
}