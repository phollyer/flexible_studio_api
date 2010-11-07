package api.shell.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.shell.notifiers.ClearNotifyEvent;
	import api.shell.Shell;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends Shell
	{
		// Required
		public var event:String = null;
		
		public function ClearNotify(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function clearNotify( notificationEvent:String = null ):void
		{
			event = compareStrings( notificationEvent , event );
			
			switch( event )
			{
				case null:
					missingEvent();
					break;
				default:
					ssCore.Shell.clearNotify( {event:event}
											 ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"3010"} );
			}
		}
	}
}