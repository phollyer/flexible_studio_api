package api.joystick.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.notifiers.OnJoyMoveEvent;
	import api.joystick.Joystick;

	[Event(name="result", type="api.events.joystick.onJoyMove.OnJoyMoveEvent")]
	[Bindable]
	public class OnJoyMove extends Joystick
	{
		// Results
		public var id:String = null;
		public var pov:Number = -1;
		public var rudder:Number = -1;
		public var uAxis:Number = -1;
		public var vAxis:Number = -1;
		public var xAxis:Number = -1;
		public var yAxis:Number = -1;
		public var zAxis:Number = -1;
				
		public function OnJoyMove(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyMove"}
									  ,{callback:actionComplete, errorSTR:"onJoyMoveError", code:"24005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			id = __r[ 0 ]; 
			xAxis = Number( __r[ 1] );
			yAxis = Number( __r[ 2 ] );
			zAxis = Number( __r[ 3 ] );
			rudder = Number( __r[ 4 ] );
			uAxis = Number( __r[ 5 ] );
			vAxis = Number( __r[ 6 ] );
			pov = Number( __r[ 7 ] );
			
			var e : OnJoyMoveEvent = new OnJoyMoveEvent( OnJoyMoveEvent.RESULT );
			e.id = id;
			e.pov = pov;
			e.rudder = rudder
			e.uAxis = uAxis;
			e.vAxis = vAxis;
			e.xAxis = xAxis;
			e.yAxis = yAxis;
			e.zAxis = zAxis;
			dispatchEvent( e );
		}
	}
}