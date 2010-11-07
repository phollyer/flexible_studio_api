package api.wmVideo.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.wmVideo.notifiers.ClearNotifyEvent;
	import api.wmVideo.WmVideo;
	
	[Event(name="missingEvent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ClearNotify extends WmVideo
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
					ssCore.WmVideo.clearNotify( {event:event}
										   ,{callback:actionComplete, errorSTR:"clearNotifyError", code:"46024"} );
			}
		}
	}
}