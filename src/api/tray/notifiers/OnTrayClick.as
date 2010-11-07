package api.tray.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tray.notifiers.OnTrayClickEvent;
	import api.tray.Tray;
	
	[Event(name="result", type="api.events.tray.onTrayClick.OnTrayClickEvent")]
	[Bindable]
	public class OnTrayClick extends Tray
	{		
		// Result
		public var button:String = null;
		
		public function OnTrayClick(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tray.setNotify( {event:"onTrayClick"}
							 	  ,{callback:actionComplete, errorSTR:"onTrayClickError", code:"43006"} );
		}
		override protected function sendResult( r:Object ):void
		{
			button = r.result;
			
			var e : OnTrayClickEvent = new OnTrayClickEvent( OnTrayClickEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}