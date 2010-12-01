package api.joystick.notifiers
{
	import api.events.joystick.notifiers.OnJoyButtonMaskEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.joystick.notifiers.OnJoyButtonMaskEvent.RESULT
	*/
	[Event(name="result", type="api.events.joystick.onJoyButtonMask.OnJoyButtonMaskEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyButtonMask.html Northcode Help Documentation
	*/
	public class OnJoyButtonMask extends Joystick
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
		* @defaultValue <code>null</code>
		*/
		public var mask:String = null;
				
		/**
		* Constructor for Joystick.OnJoyButtonMask()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyButtonMask.html Northcode Help Documentation
		*/
		public function OnJoyButtonMask(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyButtonMask"}
									  ,{callback:actionComplete, errorSTR:"onJoyButtonMaskError", code:"24009"} );
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
			mask = __r[ 1];
			
			var e : OnJoyButtonMaskEvent = new OnJoyButtonMaskEvent( OnJoyButtonMaskEvent.RESULT );
			e.id = id;
			e.mask = mask;
			dispatchEvent( e );
		}
	}
}