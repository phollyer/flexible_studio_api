package api.mouse.sendClick
{
	import flash.events.IEventDispatcher;
	import api.mouse.Mouse;

	[Event(name="missingButton" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendClick extends Mouse
	{
		public static const LEFT:String = "left";
		public static const MIDDLE:String = "middle";
		public static const RIGHT:String = "right";
		
		// Required
		public var button:String = null;
		
		public function SendClick(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendClick( mouseButton:String = null ):void
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
					ssCore.Mouse.sendClick( {button:button}
									  	   ,{callback:actionComplete, errorSTR:"sendClickError", code:"29003"} );
					break;
				default:
					invalidButton();
			}
		}
		private function invalidButton():void
		{
			var e : SendClickEvent = new SendClickEvent( SendClickEvent.RESULT_BUTTON );
			dispatchEvent( e );
		}
	}
}