package api.tray.notifiers
{
	import api.events.tray.notifiers.OnTrayClickEvent;

	import api.tray.Tray;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.tray.notifiers.OnTrayClickEvent.RESULT
	*/
	[Event(name="result", type="api.events.tray.onTrayClick.OnTrayClickEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_onTrayClick.html Northcode Help Documentation
	*/
	public class OnTrayClick extends Tray
	{		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var button:String = null;
		
		/**
		* Constructor for Tray.OnTrayClick()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tray_onTrayClick.html Northcode Help Documentation
		*/
		public function OnTrayClick(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tray.setNotify( {event:"onTrayClick"}
							 	  ,{callback:actionComplete, errorSTR:"onTrayClickError", code:"43006"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			button = r.result;
			
			var e : OnTrayClickEvent = new OnTrayClickEvent( OnTrayClickEvent.RESULT );
			e.button = button;
			dispatchEvent( e );
		}
	}
}