package api.joystick.notifiers
{
	import api.events.joystick.notifiers.OnJoyComboEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.joystick.notifiers.OnJoyComboEvent.RESULT
	*/
	[Event(name="result", type="api.events.joystick.onJoyCombo.OnJoyComboEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyCombo.html Northcode Help Documentation
	*/
	public class OnJoyCombo extends Joystick
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
		* Constructor for Joystick.OnJoyCombo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_onJoyCombo.html Northcode Help Documentation
		*/
		public function OnJoyCombo(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyCombo"}
									  ,{callback:actionComplete, errorSTR:"onJoyComboError", code:"24010"} );
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
			
			var e : OnJoyComboEvent = new OnJoyComboEvent( OnJoyComboEvent.RESULT );
			e.id = id;
			e.mask = mask;
			dispatchEvent( e );
		}
	}
}