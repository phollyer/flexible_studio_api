package api.mouse.sendDoubleClick
{
	import flash.events.IEventDispatcher;
	import api.mouse.Mouse;

	[Event(name="missingButton" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendDoubleClick extends Mouse
	{
		public static const LEFT:String = "left";
		public static const MIDDLE:String = "middle";
		public static const RIGHT:String = "right";
		
		// Required
		public var button:String = null;
		
		public function SendDoubleClick(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendDoubleClick( mouseButton:String = null ):void
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
					ssCore.Mouse.sendDoubleClick( {button:button}
									  	   ,{callback:actionComplete, errorSTR:"sendDoubleClickError", code:"29004"} );
					break;
				default:
					invalidButton();
			}
		}
		private function invalidButton():void
		{
			var e : SendDoubleClickEvent = new SendDoubleClickEvent( SendDoubleClickEvent.RESULT_BUTTON );
			dispatchEvent( e );
		}
	}
}