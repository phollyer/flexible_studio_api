package api.fileSys.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.app.notifiers.ClearNotifyEvent;
	import api.fileSys.FileSys;

	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends FileSys
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
					ssCore.FileSys.clearNotify( {event:event}
											   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"9040"} );
			}
		}
	}
}