package api.joystick.notifiers
{
	import api.events.joystick.notifiers.OnJoyPOVEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.joystick.notifiers.OnJoyPOVEvent.RESULT
	*/
	[Event(name="result", type="api.events.joystick.onJoyPOV.OnJoyPOVEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyPOV.html Northcode Help Documentation
	*/
	public class OnJoyPOV extends Joystick
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var id:String = null;
		public var pov:Number = -1;
				
		/**
		* Constructor for Joystick.OnJoyPOV()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyPOV.html Northcode Help Documentation
		*/
		public function OnJoyPOV(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyPOV"}
									  ,{callback:actionComplete, errorSTR:"onJoyPOVError", code:"24006"} );
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
			pov = Number( __r[ 1 ] );
			
			var e : OnJoyPOVEvent = new OnJoyPOVEvent( OnJoyPOVEvent.RESULT );
			e.id = id;
			e.pov = pov;
			dispatchEvent( e );
		}
	}
}