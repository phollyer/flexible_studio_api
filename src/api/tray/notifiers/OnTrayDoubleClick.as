package api.tray.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tray.notifiers.OnTrayDoubleClickEvent;
	import api.tray.Tray;
	
	[Event(name="result", type="api.events.tray.onTrayDoubleClick.OnTrayDoubleClickEvent")]
	[Bindable]
	public class OnTrayDoubleClick extends Tray
	{		
		// Result
		public var button:String = null;
		
		public function OnTrayDoubleClick(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tray.setNotify( {event:"onTrayDoubleClick"}
							 	  ,{callback:actionComplete, errorSTR:"onTrayDoubleClickError", code:"43007"} );
		}
		override protected function sendResult( r:Object ):void
		{
			button = r.result;
			
			var e : OnTrayDoubleClickEvent = new OnTrayDoubleClickEvent( OnTrayDoubleClickEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}