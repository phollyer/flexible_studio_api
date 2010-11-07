package api.popup.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.popup.notifiers.OnTrayMenuEvent;
	import api.popup.Popup;
	
	[Event(name="result", type="api.events.popup.onTrayMenu.OnTrayMenuEvent")]
	[Bindable]
	public class OnTrayMenu extends Popup
	{
		// Result
		public var data:String = null;
		
		public function OnTrayMenu(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Popup.setNotify( {event:"onTrayMenu"}
								   ,{callback:actionComplete, errorSTR:"onTrayMenuError", code:"31013"} );
		}
		}	
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : OnTrayMenuEvent = new OnTrayMenuEvent( OnTrayMenuEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}	
	}
}