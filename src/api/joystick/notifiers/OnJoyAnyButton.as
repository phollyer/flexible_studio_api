package api.joystick.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.notifiers.OnJoyAnyButtonEvent;
	import api.joystick.Joystick;

	[Event(name="result", type="api.events.joystick.onJoyAnyButton.OnJoyAnyButtonEvent")]
	[Bindable]
	public class OnJoyAnyButton extends Joystick
	{
		// Results
		public var button:Number = -1;
		public var id:String = null;
		public var state:Number = 0;
				
		public function OnJoyAnyButton(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyAnyButton"}
									  ,{callback:actionComplete, errorSTR:"onJoyAnyButtonError", code:"24008"} );
		}
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