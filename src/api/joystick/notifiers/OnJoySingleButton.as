package api.joystick.notifiers
{
	import api.events.joystick.notifiers.OnJoySingleButtonEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.joystick.notifiers.OnJoySingleButtonEvent.RESULT
	*/
	[Event(name="result", type="api.events.joystick.onJoySingleButton.OnJoySingleButtonEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoySingleButton.html Northcode Help Documentation
	*/
	public class OnJoySingleButton extends Joystick
	{
		// Results
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
		* Constructor for Joystick.OnJoySingleButton()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoySingleButton.html Northcode Help Documentation
		*/
		public function OnJoySingleButton(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoySingleButton"}
									  ,{callback:actionComplete, errorSTR:"onJoySingleButtonError", code:"24007"} );
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
			id = __r[ 0 ]; 
			state = Number( __r[ 1 ] );
			
			var e : OnJoySingleButtonEvent = new OnJoySingleButtonEvent( OnJoySingleButtonEvent.RESULT );
			e.id = id;
			e.state = state;
			dispatchEvent( e );
		}
	}
}