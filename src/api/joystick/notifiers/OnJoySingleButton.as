package api.joystick.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.notifiers.OnJoySingleButtonEvent;
	import api.joystick.Joystick;

	[Event(name="result", type="api.events.joystick.onJoySingleButton.OnJoySingleButtonEvent")]
	[Bindable]
	public class OnJoySingleButton extends Joystick
	{
		// Results
		public var id:String = null;
		public var state:Number = 0;
				
		public function OnJoySingleButton(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoySingleButton"}
									  ,{callback:actionComplete, errorSTR:"onJoySingleButtonError", code:"24007"} );
		}
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