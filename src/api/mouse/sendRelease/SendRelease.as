package api.mouse.sendRelease
{
	import flash.events.IEventDispatcher;
	import api.mouse.Mouse;

	[Event(name="missingButton" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendRelease extends Mouse
	{
		public static const LEFT:String = "left";
		public static const MIDDLE:String = "middle";
		public static const RIGHT:String = "right";
		
		// Required
		public var button:String = null;
		
		public function SendRelease(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendRelease( mouseButton:String = null ):void
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
					ssCore.Mouse.sendRelease( {button:button}
									  	   ,{callback:actionComplete, errorSTR:"sendReleaseError", code:"29006"} );
					break;
				default:
					invalidButton();
			}
		}
		private function invalidButton():void
		{
			var e : SendReleaseEvent = new SendReleaseEvent( SendReleaseEvent.RESULT_BUTTON );
			dispatchEvent( e );
		}
	}
}