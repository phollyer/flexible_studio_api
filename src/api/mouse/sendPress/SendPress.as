package api.mouse.sendPress
{
	import flash.events.IEventDispatcher;
	import api.mouse.Mouse;

	[Event(name="missingButton" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendPress extends Mouse
	{
		public static const LEFT:String = "left";
		public static const MIDDLE:String = "middle";
		public static const RIGHT:String = "right";
		
		// Required
		public var button:String = null;
		
		public function SendPress(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendPress( mouseButton:String = null ):void
		{
			button = compareStrings( mouseButton , button );
			
			switch( button )
			{
				case null:
					missingButton();
					break;
				case LEFT:
				case MIDDLE:
				case RIGHT:
					ssCore.Mouse.sendPress( {button:button}
									  	   ,{callback:actionComplete, errorSTR:"sendPressError", code:"29005"} );
					break;
				default:
					invalidButton();
			}
		}
		private function invalidButton():void
		{
			var e : SendPressEvent = new SendPressEvent( SendPressEvent.RESULT_BUTTON );
			dispatchEvent( e );
		}
	}
}