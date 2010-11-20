package api.joystick.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.notifiers.OnJoyComboEvent;
	import api.joystick.Joystick;

	[Event(name="result", type="api.events.joystick.onJoyCombo.OnJoyComboEvent")]
	[Bindable]
	public class OnJoyCombo extends Joystick
	{
		// Results
		public var id:String = null;
		public var mask:String = null;
				
		public function OnJoyCombo(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyCombo"}
									  ,{callback:actionComplete, errorSTR:"onJoyComboError", code:"24010"} );
		}
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